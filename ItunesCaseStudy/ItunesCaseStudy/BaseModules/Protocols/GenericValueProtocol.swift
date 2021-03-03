//
//  GenericValueProtocol.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation

protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value { get }
}
