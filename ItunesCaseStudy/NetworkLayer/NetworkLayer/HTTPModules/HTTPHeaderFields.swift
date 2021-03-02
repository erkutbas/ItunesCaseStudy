//
//  HTTPHeaderFields.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 23.02.2021.
//

import Foundation

enum HTTPHeaderFields {

    case contentType
    
    var value: (String, String) {
        switch self {
        case .contentType:
            return ("Content-Type", "application/json; charset=utf-8")
        }
    }

}
