//
//  ConstantEndpoints.swift
//  DataLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

typealias Paths = ConstantEndpoints.Paths

struct ConstantEndpoints {
    
    // MARK: - BaseUrls according to environments -
    struct BaseUrls {
        static let developmentBaseEndpointUrl = "https://itunes.apple.com/"
        static let testBaseEndpointUrl = "https://itunes.apple.com/"
        static let qualityAssuranceBaseEndpointUrl = "https://itunes.apple.com/"
    }
    
    // MARK: - Paths ... -
    enum Paths {
        case search
        
        /*
         
         other paths....
         
         */
        
        // MARK: - Endpoint Paths -
        var path: String {
            switch self {

            case .search:
                return "search"
            }
        }
    }
    
}
