//
//  CompletableUseCase.swift
//  DomainLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

class CompletableUseCase<Params>: BaseUseCase<Params, Completed> {
    
    func execute(params: Params) {
        generateUseCase(parameter: params) { (result) in
            // there is nothing to do, we just know that usecase completed
        }
    }
    
    deinit {
        print("DEINIT CompletableUseCase")
    }
    
}
