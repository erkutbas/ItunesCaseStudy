//
//  ItemDetailLocalizables.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

enum ItemDetailLocalizables: GenericValueProtocol {
    
    typealias Value = String
    
    case rent
    case buy
    
    var value: String {
        switch self {
        case .rent:
            return "rent".toLocalize()
        case .buy:
            return "buy".toLocalize()
        }
    }
}
