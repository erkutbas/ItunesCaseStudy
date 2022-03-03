//
//  SearchOperationServiceCreator.swift
//  DataLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import DomainLayer

public class SearchOperationServiceCreator {
    
    public init() { }
    
    public func getSearchServiceUrlRequest(with request: ItunesSearchRequest) throws -> URLRequest {
        return try SearchOperationServiceProvider(request: request).returnUrlRequest()
    }
    
    deinit {
        print("DEINIT SearchOperationServiceCreator")
    }
    
}
