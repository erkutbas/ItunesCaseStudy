//
//  CollectionInfoViewComponenData.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

class CollectionInfoViewComponentData {
    
    private(set) var price: Double
    private(set) var name: String
    private(set) var release: String
    
    init(price: Double, name: String, release: String) {
        self.price = price
        self.name = name
        self.release = release
        
    }
    
}
