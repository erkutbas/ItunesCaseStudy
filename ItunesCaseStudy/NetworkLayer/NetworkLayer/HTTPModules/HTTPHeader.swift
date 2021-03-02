//
//  HTTPHeader.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 23.02.2021.
//

import Foundation

public struct HTTPHeader: Hashable {
    public let name: String
    public let value: String

    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
