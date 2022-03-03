//
//  SegmentedButtonComponent.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

class SegmentedButtonComponent: GenericBaseView<SegmentedButtonComponentData> {
    
    private var selectorLeadingConstraint = NSLayoutConstraint()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        return temp
    }()
    
    private lazy var selector: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        return temp
    }()

    private var buttonContainerComponent: ButtonContainerComponent!
    private var activationFlag: Bool = false
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponentViews()
        addButtonContainerComponent()
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setupViewData()
    }
    
    private func setupViewData() {
        guard let data = returnData() else { return }
        containerView.backgroundColor = data.containerBackgroundColor
        containerView.layer.cornerRadius = data.cornerRadius
        selector.layer.cornerRadius = data.cornerRadius - 1
        focusSelectedIndex()
    }
    
    private func focusSelectedIndex() {
        guard let data = returnData(), let focusedSegment = data.focusedSegment else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.changeSelectorPosition(by: focusedSegment)
        }
    }
    
    private func addComponentViews() {
        addSubview(containerView)
        containerView.addSubview(selector)
        
        selectorLeadingConstraint = selector.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            selectorLeadingConstraint,
            selector.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
            selector.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2),
            selector.widthAnchor.constraint(equalToConstant: getSelectorWidth())
        
            
        ])
    }
    
    private func addButtonContainerComponent() {
        guard let data = returnData() else { fatalError("Please provide buttons data") }
        
        data.buttonContainerData.buttons.forEach({ $0.appendNewAction(with: buttonClickedListener) })
        
        buttonContainerComponent = ButtonContainerComponent(data: data.buttonContainerData)
        buttonContainerComponent.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(buttonContainerComponent)
        
        NSLayoutConstraint.activate([
        
            buttonContainerComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2),
            buttonContainerComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2),
            buttonContainerComponent.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            buttonContainerComponent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
            
        ])
        
    }
    
    private lazy var buttonClickedListener: ButtonActionType = { [weak self] (actionIndex) in
        self?.changeSelectorPosition(by: actionIndex)
    }
    
    private func changeSelectorPosition(by index: Int) {
        let stepSize = CGFloat((index + 1) * 2)
        let updatedLeadingConstraintConstant = (getSelectorWidth() * CGFloat(index) + stepSize)
        
        selectorLeadingConstraint.constant = updatedLeadingConstraintConstant
        
        UIView.animate(withDuration: 0.4) {
            self.layoutIfNeeded()
        } completion: { (finish) in
            
        }
    }
    
    private func getSelectorWidth() -> CGFloat {
        guard let data = returnData(), self.frame.width > 0 else { fatalError("Please provide component size") }
        let redundantSpace = CGFloat((data.buttonContainerData.buttons.count - 1) * 2 + 4)
        return (self.frame.width - redundantSpace) / CGFloat(data.buttonContainerData.buttons.count)
    }
    
    func activationManager(isHidden: Bool) {
        if isHidden != activationFlag {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) {
                    if isHidden {
                        self.alpha = 0
                    } else {
                        self.alpha = 1
                    }
                    self.activationFlag = isHidden
                }
            }
        }
    }
    
}
