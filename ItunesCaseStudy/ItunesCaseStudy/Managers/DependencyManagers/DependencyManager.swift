//
//  DependencyManager.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

class DependencyManager {
    private let apiManagerInjectable: APIManagerInjectable
    private let imageCacheManager: ImageCacheManager
    
    init() {
        self.apiManagerInjectable = APIManagerInjectable()
        self.imageCacheManager = ImageCacheManager()
        addDependencies()
    }
    
    private func addDependencies() {
        let resolver = Resolver.shared
        resolver.add(apiManagerInjectable)
        resolver.add(imageCacheManager)
    }
}
