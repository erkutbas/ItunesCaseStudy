//
//  ParameterEncoder.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
