//
//  ErrorResult.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 1.03.2021.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
