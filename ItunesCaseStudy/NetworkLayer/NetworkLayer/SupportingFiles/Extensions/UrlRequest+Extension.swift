//
//  UrlRequest+Extension.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

extension URLRequest {
    
    public var headers: HTTPHeaders {
        get { allHTTPHeaderFields.map(HTTPHeaders.init) ?? HTTPHeaders() }
        set { allHTTPHeaderFields = newValue.dictionary }
    }
    
}
