//
//  URLRequestProtocol.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 23.02.2021.
//

import Foundation

protocol URLRequestProtocol {
    func returnUrlRequest() throws -> URLRequest
}
