//
//  ItunesSearchRequest.swift
//  DomainLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import NetworkEntityLayer

public class ItunesSearchRequest: BaseRequest {
    private(set) var term: String
    private(set) var limit: Int = 10
    private(set) var offset: Int = 10
    public var media: String
    
    public init(term: String, media: String) {
        self.term = term
        self.media = media
    }
    
    public func setLimit(by value: Int) -> Self {
        self.limit = value
        return self
    }
    
    public func setOffset(by value: Int) -> Self {
        self.offset = value
        return self
    }
}
