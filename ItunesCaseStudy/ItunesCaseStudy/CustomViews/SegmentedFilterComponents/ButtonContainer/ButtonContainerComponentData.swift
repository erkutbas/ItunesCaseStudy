//
//  ButtonContainerComponentData.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 2.03.2021.
//

import UIKit

class ButtonContainerComponentData {
    
    private(set) var buttons: [MediaButtonData]
    private(set) var containerBackgroundColor: UIColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
    private(set) var spacing: CGFloat = 2.0
    
    init(buttons: [MediaButtonData]) {
        self.buttons = buttons
    }
    
    func setSpacing(by value: CGFloat) -> Self {
        self.spacing = value
        return self
    }
    
    func setContainerBackgroundColor(by value: UIColor) -> Self {
        self.containerBackgroundColor = value
        return self
    }
}
