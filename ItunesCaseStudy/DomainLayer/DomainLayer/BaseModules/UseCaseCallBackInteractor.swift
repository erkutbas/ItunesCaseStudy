//
//  UseCaseCallBackInteractor.swift
//  DomainLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import NetworkEntityLayer

protocol UseCaseCallBackInteractor {
    
    associatedtype Response
    
    var onSuccessCompletion: ((Response) -> Void)? { get }
    
    func onSuccess(response: Response)
    func onError(error: ErrorResponse)
    
    func onSuccess(completion: @escaping (Response) -> Void)
    func onError(completion: @escaping (ErrorResponse) -> Void)
    func commonResult(completion: @escaping (Result<Response, ErrorResponse>) -> Void)
    
}
