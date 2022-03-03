//
//  MediaButton.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

class MediaButton: UIButton {
    
    private var data: MediaButtonData
    private var buttonPressed: (() -> Void)?
    
    init(data: MediaButtonData) {
        self.data = data
        super.init(frame: .zero)
        setupViewConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViewConfigurations() {
        backgroundColor = data.backgroundColor
        
        titleLabel?.font = data.font
        
        setTitle(data.mediaItemType.value.title, for: .normal)
        setTitleColor(data.titleColor, for: .normal)
        setTitleColor(data.highlightedTitleColor, for: .highlighted)
            
        addTarget(self, action: .buttonAction, for: .touchUpInside)
        addTarget(self, action: .buttonActionOut, for: .touchUpOutside)
    }
    
    @objc fileprivate func buttonAction(_ sender: UIButton) {
        manageButtonFont(active: true)
        data.actionBlock?.forEach({ (block) in
            block(data.mediaItemType.value.index)
        })
    }
    
    @objc fileprivate func buttonActionOut(_ sender: UIButton) {
        manageButtonFont(active: false)
        data.actionBlock?.forEach({ (block) in
            block(data.mediaItemType.value.index)
        })
    }
    
    private func manageButtonFont(active: Bool) {
        if active {
            titleLabel?.font = data.selectedFont
        } else {
            titleLabel?.font = data.font
        }
    }
    
    func listenButtonAction(by completion: @escaping () -> Void) -> Self {
        buttonPressed = completion
        return self
    }
    
}

fileprivate extension Selector {
    static let buttonAction = #selector(MediaButton.buttonAction)
    static let buttonActionOut = #selector(MediaButton.buttonActionOut)
}
