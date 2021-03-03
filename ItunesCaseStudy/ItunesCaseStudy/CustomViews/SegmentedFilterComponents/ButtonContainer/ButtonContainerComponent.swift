//
//  ButtonContainerComponent.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 2.03.2021.
//

import UIKit

class ButtonContainerComponent: GenericBaseView<ButtonContainerComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .fill
        temp.distribution = .fillEqually
        temp.axis = .horizontal
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addMainStackView()
    }
    
    private func addMainStackView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setupViewConfigurations()
        appendButtons()
    }
    
    private func setupViewConfigurations() {
        guard let data = returnData() else { return }
        mainStackView.spacing = data.spacing
    }
    
    private func appendButtons() {
        guard let data = returnData() else { return }
        data.buttons.forEach({ mainStackView.addArrangedSubview(MediaButton(data: $0)) })
        
    }
    
    
}
