//
//  SearchRepositoryProtocol.swift
//  DomainLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import NetworkEntityLayer

public protocol SearchRepositoryProtocol {
    
    func getItunesMediaData(with request: ItunesSearchRequest, completion: @escaping (Result<ItunesSearchResponse, ErrorResponse>) -> Void)
    
}
