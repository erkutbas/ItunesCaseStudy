//
//  BaseUseCase.swift
//  DomainLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import NetworkEntityLayer

public class BaseUseCase<P, T>: BaseUseCaseProtocol {
    
    typealias Parameters = P
    typealias Responses = T
    
    public func generateUseCase(parameter: P, completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        
    }
    
    deinit {
        print("DEINIT BaseUseCase")
    }
}
