//
//  ApiConnectionErrorType.swift
//  NetworkEntityLayer
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation

public enum ApiConnectionErrorType {
    case missingData(Int)
    case connectionError(Int)
    case serverError(Int)
    case dataDecodedFailed(String)
}
