//
//  MediaButtonData.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 2.03.2021.
//

import UIKit

typealias ButtonActionType = (Int) -> Void

class MediaButtonData {
    private(set) var mediaItemType: MediaItemType
    private(set) var titleColor: UIColor = .black
    private(set) var highlightedTitleColor: UIColor = .white
    private(set) var font: UIFont? = FontManager.SourceSansPro.Regular(14).value
    private(set) var selectedFont: UIFont? = FontManager.SourceSansPro.SemiBold(14).value
    private(set) var backgroundColor: UIColor = .clear
    private(set) var actionBlock: [ButtonActionType]?
    
    init(mediaItemType: MediaItemType) {
        self.mediaItemType = mediaItemType
    }
    
    func setTitleColor(by value: UIColor) -> Self {
        self.titleColor = value
        return self
    }
    
    func setHighlightedTitleColor(by value: UIColor) -> Self {
        self.highlightedTitleColor = value
        return self
    }
    
    func setBackgroundColor(by value: UIColor) -> Self {
        self.backgroundColor = value
        return self
    }
    
    func setFont(by value: UIFont) -> Self {
        self.font = value
        return self
    }
    
    func setSelectedFont(by value: UIFont) -> Self {
        self.selectedFont = value
        return self
    }
    
    func appendNewAction(with block: @escaping ButtonActionType) -> Self {
        if actionBlock == nil {
            actionBlock = [block]
        } else {
            actionBlock?.append(block)
        }
        return self
    }
}
