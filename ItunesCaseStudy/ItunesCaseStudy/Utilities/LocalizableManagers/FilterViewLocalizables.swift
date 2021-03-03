//
//  FilterViewLocalizables.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 27.02.2021.
//

import Foundation

enum FilterViewLocalizables: GenericValueProtocol {
    
    typealias Value = String
    
    case cancel
    case movie
    case music
    case app
    case book
    
    var value: String {
        switch self {
        case .cancel:
            return "cancel".toLocalize()
        case .movie:
            return "movie".toLocalize()
        case .music:
            return "music".toLocalize()
        case .app:
            return "app".toLocalize()
        case .book:
            return "book".toLocalize()
        }
    }
    
}
