//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 23.02.2021.
//

import Foundation

public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
