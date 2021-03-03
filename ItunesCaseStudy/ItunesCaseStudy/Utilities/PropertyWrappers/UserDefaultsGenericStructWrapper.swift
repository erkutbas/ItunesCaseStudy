//
//  UserDefaultsGenericStructWrapper.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 24.02.2021.
//
import Foundation

@propertyWrapper
struct UserDefaultsGenericStructWrapper<T1: Codable> {
    let key: String
    let defaultValue: T1

    init(key: String, defaultValue: T1) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T1 {
        get {
            return UserDefaults.standard.structData(T1.self, forKey: key) ?? defaultValue
        }
        set {
            UserDefaults.standard.setStruct(newValue, forKey: key)
        }
    }
}
