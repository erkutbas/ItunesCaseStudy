//
//  ItunesSearchUseCase.swift
//  DomainLayer
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation
import NetworkEntityLayer

public class ItunesSearchUseCase: SingleResponseUseCase<ItunesSearchRequest, ItunesSearchResponse> {
    
    private let repository: SearchRepositoryProtocol
    
    public init(repository: SearchRepositoryProtocol) {
        self.repository = repository
    }

    public override func generateUseCase(parameter: ItunesSearchRequest, completion: @escaping (Result<ItunesSearchResponse, ErrorResponse>) -> Void) {
        repository.getItunesMediaData(with: parameter, completion: completion)
    }
    
    deinit {
        print("DEINIT ItunesSearchUseCase")
    }
    
}
