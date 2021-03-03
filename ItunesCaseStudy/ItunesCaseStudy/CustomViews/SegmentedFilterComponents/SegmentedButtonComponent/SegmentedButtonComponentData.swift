//
//  SegmentedButtonComponentData.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 3.03.2021.
//

import UIKit

class SegmentedButtonComponentData {
    
    private(set) var buttonContainerData: ButtonContainerComponentData
    private(set) var containerBackgroundColor: UIColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    private(set) var cornerRadius: CGFloat = 10
    private(set) var focusedSegment: Int?
    
    init(buttonContainerData: ButtonContainerComponentData) {
        self.buttonContainerData = buttonContainerData
    }
    
    func setContainerBackgroundColor(by value: UIColor) -> Self {
        self.containerBackgroundColor = value
        return self
    }
    
    func setCornerRadius(by value: CGFloat) -> Self {
        self.cornerRadius = value
        return self
    }
    
    func setFocusedSegment(by value: Int?) -> Self {
        self.focusedSegment = value
        return self
    }
    
}
