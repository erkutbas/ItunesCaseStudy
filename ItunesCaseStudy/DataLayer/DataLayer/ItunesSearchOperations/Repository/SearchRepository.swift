//
//  SearchRepository.swift
//  DataLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import DomainLayer
import NetworkEntityLayer

public class SearchRepository: SearchRepositoryProtocol {

    private let apiRemote: SearchApiRemoteProtocol
    
    public init(apiRemote: SearchApiRemoteProtocol) {
        self.apiRemote = apiRemote
    }
    
    public func getItunesMediaData(with request: ItunesSearchRequest, completion: @escaping (Result<ItunesSearchResponse, ErrorResponse>) -> Void) {
        apiRemote.getItunesMediaData(with: request, completion: completion)
    }
    
    deinit {
        print("DEINIT SearchRepository")
    }

}
