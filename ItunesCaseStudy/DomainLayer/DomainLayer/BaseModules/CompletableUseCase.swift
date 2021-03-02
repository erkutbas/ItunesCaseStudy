//
//  CompletableUseCase.swift
//  DomainLayer
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation

class CompletableUseCase<Params>: BaseUseCase<Params, Completed> {
    
    func execute(params: Params) {
        generateUseCase(parameter: params) { [weak self](result) in
            // there is nothing to do
        }
    }
    
    deinit {
        print("DEINIT CompletableUseCase")
    }
    
}
