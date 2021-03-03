//
//  Inject.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation

@propertyWrapper
struct Inject<T: Injectable> {
    let wrappedValue: T
    
    init() {
        wrappedValue = Resolver.shared.resolve()
    }
    
}
