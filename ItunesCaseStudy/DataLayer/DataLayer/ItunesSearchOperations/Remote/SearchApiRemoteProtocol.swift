//
//  SearchApiRemoteProtocol.swift
//  DataLayer
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation
import DomainLayer
import NetworkEntityLayer

public protocol SearchApiRemoteProtocol {
    func getItunesMediaData(with request: ItunesSearchRequest, completion: @escaping (Result<ItunesSearchResponse, ErrorResponse>) -> Void)
}
