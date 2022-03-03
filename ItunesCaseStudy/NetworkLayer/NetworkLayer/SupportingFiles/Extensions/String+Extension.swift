//
//  String+Extension.swift
//  NetworkLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

extension String {
    
    func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw NetworkError.missingURL }
        return url
    }
}
