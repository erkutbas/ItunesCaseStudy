//
//  ItemCollectionComponentData.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

class ItemCollectionComponentData {

    private(set) var segmentedButtonData: SegmentedButtonComponentData
    private(set) var layoutData: ItemCollectionViewFlowLayoutData = ItemCollectionViewFlowLayoutData()

    init(segmentedButtonData: SegmentedButtonComponentData) {
        self.segmentedButtonData = segmentedButtonData
    }
    
    func setLayoutData(by value: ItemCollectionViewFlowLayoutData) -> Self {
        self.layoutData = value
        return self
    }
    
}
