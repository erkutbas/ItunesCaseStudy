//
//  APIManager.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 23.02.2021.
//

import Foundation
import Network
import NetworkEntityLayer

public class APIManager: APIManagerProtocol {
    
    public static let shared = APIManager()

    // Mark: - Session -
    private let session: URLSession

    // Mark: - JsonDecoder -
    private var jsonDecoder = JSONDecoder()
    
    public init() {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 300
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.session = URLSession(configuration: config)
    }
    
    public func executeRequest<R>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void) where R : BaseResponse {
        print("url : \(urlRequest.url?.absoluteString)")
        session.dataTask(with: urlRequest) { [weak self](data, urlResponse, error) in
            self?.dataTaskHandler(data, urlResponse, error, completion: completion)
        }.resume()
        
    }
    
    private func dataTaskHandler<R: BaseResponse>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completion: @escaping (Result<R, ErrorResponse>) -> Void) {
        
        if let error = error {
            // completion failure
            completion(.failure(ErrorResponse(serverResponse: ServerResponse(returnMessage: error.localizedDescription, returnCode: error._code), apiConnectionErrorType: .serverError(error._code))))
        }
        
        handleHTTPResponse(by: response, completion: completion)
        
        if let data = data {
            
            do {
                //print(String(data: data, encoding: .utf8)!)
                let dataDecoded = try jsonDecoder.decode(R.self, from: data)
                completion(.success(dataDecoded))
            } catch let error {
                print("error :\(error)")
            }
        }
        
    }
    
    deinit {
        print("DEINIT APIMANAGER")
    }
    
    private func handleHTTPResponse<R: BaseResponse>(by response: URLResponse?, completion: @escaping (Result<R, ErrorResponse>) -> Void) {
        guard let response = response as? HTTPURLResponse else {
            return
        }
        
        switch response.statusCode {
        case 200 ... 299:
            print("success")
        default:
            print("failure")
            //completion(.failure(ErrorResponse(serverResponse: ServerResponse(returnMessage: LocalizableManager.networkError.value, returnCode: response.statusCode), apiConnectionErrorType: .serverError(response.statusCode))))
        }
        
    }
    
}