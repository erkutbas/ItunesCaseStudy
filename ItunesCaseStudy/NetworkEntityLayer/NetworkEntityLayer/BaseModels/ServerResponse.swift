//
//  ServerResponse.swift
//  NetworkEntityLayer
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation

public class ServerResponse: Codable, Error {
    private(set) var returnMessage: String?
    private(set) var returnCode: Int?

    public init(returnMessage: String? = nil, returnCode: Int? = nil) {
        self.returnMessage = returnMessage
        self.returnCode = returnCode
    }
}
