//
//  BaseUseCaseProtocol.swift
//  DomainLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import NetworkEntityLayer

protocol BaseUseCaseProtocol {
    
    associatedtype Parameters
    associatedtype Responses
    
    func generateUseCase(parameter: Parameters, completion: @escaping (Result<Responses, ErrorResponse>) -> Void)
}
