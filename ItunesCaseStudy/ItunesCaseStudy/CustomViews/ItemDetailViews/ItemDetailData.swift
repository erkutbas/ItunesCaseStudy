//
//  ItemDetailData.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 28.02.2021.
//

import Foundation
import DomainLayer

class ItemDetailData {
    private(set) var itemIndex: Int
    private(set) var itunesSearchResult: ItunesSearchResult
    
    init(itunesSearchResult: ItunesSearchResult, itemIndex: Int) {
        self.itunesSearchResult = itunesSearchResult
        self.itemIndex = itemIndex
    }
}
