//
//  UserDefaults+Extension.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 24.02.2021.
//


import Foundation

// MARK: - UserDefaults Extensions -
extension UserDefaults {
    
    open func setStruct<T: Codable>(_ value: T?, forKey defaultName: String){
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }
    
    open func structData<T>(_ type: T.Type, forKey defaultName: String) -> T? where T : Decodable {
        guard let encodedData = data(forKey: defaultName) else {
            return nil
        }
        
        return try? JSONDecoder().decode(type, from: encodedData)
    }
    
}
