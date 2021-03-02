//
//  ErrorResponse.swift
//  NetworkEntityLayer
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation

public class ErrorResponse: Error {
    private(set) var serverResponse: ServerResponse?
    private(set) var apiConnectionErrorType: ApiConnectionErrorType?

    public init(serverResponse: ServerResponse? = nil, apiConnectionErrorType: ApiConnectionErrorType? = nil) {
        self.serverResponse = serverResponse
        self.apiConnectionErrorType = apiConnectionErrorType
    }

}
