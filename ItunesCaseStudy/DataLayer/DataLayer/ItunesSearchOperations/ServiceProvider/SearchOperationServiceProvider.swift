//
//  SearchOperationServiceProvider.swift
//  DataLayer
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation
import DomainLayer
import NetworkLayer

public class SearchOperationServiceProvider: ApiServiceProvider<ItunesSearchRequest> {
    
    public init(request: ItunesSearchRequest) {
        super.init(method: .get, baseUrl: ConstantEndpoints.BaseUrls.developmentBaseEndpointUrl, path: Paths.search.path, data: request)
    }
    
    deinit {
        print("DEINIT SearchOperationServiceProvider")
    }
}
