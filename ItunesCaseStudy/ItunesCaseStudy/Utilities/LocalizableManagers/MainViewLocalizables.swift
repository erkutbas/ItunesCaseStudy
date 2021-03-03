//
//  MainViewLocalizables.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 27.02.2021.
//

import Foundation

enum MainViewLocalizables: GenericValueProtocol {
    
    typealias Value = String
    
    case viewTitle
    case searchBarPlaceHolder
    
    var value: String {
        switch self {
        case .viewTitle:
            return "itunesSearchViewController".toLocalize()
        case .searchBarPlaceHolder:
            return "searchBarPlaceHolderText".toLocalize()
        }
    }
    
}
