//
//  Resolver.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation

class Resolver {
    
    private var storage = [String: Injectable]()
    
    static let shared = Resolver()
    private init() {}
    
    func add<T: Injectable>(_ injectable: T) {
        let key = String(reflecting: injectable)
        storage[key] = injectable
    }

    func resolve<T: Injectable>() -> T {
        let key = String(reflecting: T.self)
        
        guard let injectable = storage[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }
        
        return injectable
    }
    
}
