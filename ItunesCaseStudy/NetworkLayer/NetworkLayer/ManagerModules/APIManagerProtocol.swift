//
//  APIManagerProtocol.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 23.02.2021.
//

import Foundation
import NetworkEntityLayer

public protocol APIManagerProtocol {
    func executeRequest<R: BaseResponse>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void)
}
