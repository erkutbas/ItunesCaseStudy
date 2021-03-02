//
//  UseCaseCallBack.swift
//  DomainLayer
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation
import NetworkEntityLayer

typealias Completed = () -> Void

open class UseCaseCallBack<T>: UseCaseCallBackInteractor {
    typealias Response = T
    
    var onSuccessCompletion: ((T) -> Void)?
    var onErrorCompletion: ((ErrorResponse) -> Void)?
    var onCallBackResultCompletion: ((Result<T, ErrorResponse>) -> Void)?
    var completed: Completed?
    
    public init() { }

    public func onSuccess(response: T) {
        onSuccessCompletion?(response)
        onCallBackResultCompletion?(.success(response))
    }
    
    public func onError(error: ErrorResponse) {
        onErrorCompletion?(error)
        onCallBackResultCompletion?(.failure(error))
    }
    
    public func onSuccess(completion: @escaping (T) -> Void) {
        onSuccessCompletion = completion
    }
    
    public func onError(completion: @escaping (ErrorResponse) -> Void) {
        onErrorCompletion = completion
    }
    
    public func commonResult(completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        onCallBackResultCompletion = completion
    }
    
}
