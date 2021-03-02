//
//  SearchApiRemote.swift
//  DataLayer
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation
import DomainLayer
import NetworkEntityLayer
import NetworkLayer

public class SearchApiRemote: SearchApiRemoteProtocol {
    
    private let apiManager: APIManagerProtocol
    private let serviceCreator: SearchOperationServiceCreator
    
    public init(apiManager: APIManagerProtocol, serviceCreator: SearchOperationServiceCreator) {
        self.apiManager = apiManager
        self.serviceCreator = serviceCreator
    }
    
    public func getItunesMediaData(with request: ItunesSearchRequest, completion: @escaping (Result<ItunesSearchResponse, ErrorResponse>) -> Void) {
        do {
            try apiManager.executeRequest(urlRequest: serviceCreator.getSearchServiceUrlRequest(with: request), completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    deinit {
        print("DEINIT SearchApiRemote")
    }
    
}
