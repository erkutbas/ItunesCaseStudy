//
//  SearchOperationFactory.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation
import DataLayer
import DomainLayer

class SearchOperationFactory {
    
    @Inject var injectedAPIManager: APIManagerInjectable
    
    func getSearchUseCase() -> ItunesSearchUseCase {
        
        return ItunesSearchUseCase(repository: SearchRepository(apiRemote: SearchApiRemote(apiManager: injectedAPIManager.apiManager, serviceCreator: SearchOperationServiceCreator())))
    }
    
}
