//
//  ItemCollectionViewFlowLayoutData.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 26.02.2021.
//

import UIKit

class ItemCollectionViewFlowLayoutData {
    
    private(set) var itemHeight: CGFloat = 180
    private(set) var minimumWidth: CGFloat = 300
    private(set) var lineSpacing: CGFloat = 20
    private(set) var edgeInset: CGFloat = 20

    func setItemHeight(by value: CGFloat) -> Self {
        self.itemHeight = value
        return self
    }
    
    func setMinimumWidth(by value: CGFloat) -> Self {
        self.minimumWidth = value
        return self
    }
    
    func setLineSpacing(by value: CGFloat) -> Self {
        self.lineSpacing = value
        return self
    }
    
    func setEdgeInset(by value: CGFloat) -> Self {
        self.edgeInset = value
        return self
    }
    
}
