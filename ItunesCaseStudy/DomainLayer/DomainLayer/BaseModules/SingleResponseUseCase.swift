//
//  SingleResponseUseCase.swift
//  DomainLayer
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation
import NetworkEntityLayer

public class SingleResponseUseCase<Params, T>: BaseUseCase<Params, T> {
    
    public func execute(useCaseCallBack: UseCaseCallBack<T>, params: Params) {
        
        generateUseCase(parameter: params) { (result) in
            
            switch result {
            case .failure(let error):
                self.onErrorCondition(useCaseCallBack: useCaseCallBack, error: error)
            case .success(let data):
                useCaseCallBack.onSuccess(response: data)
            }
            
        }
        
    }
    
    private func onErrorCondition(useCaseCallBack: UseCaseCallBack<T>, error: Error) {
        guard let error = error as? ErrorResponse else { return }
        useCaseCallBack.onError(error: error)
    }
    
    deinit {
        print("DEINIT SingleResponseUseCase")
    }
    
}
