//
//  SplashScreenViewModel.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation

protocol SplashScreenCoordinatorDelegate: CoordinatorDelegate {
    
}

class SplashScreenViewModel: BaseViewModelDelegate {
    
    private weak var delegate: SplashScreenCoordinatorDelegate?
    
    init(delegate: SplashScreenCoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    /// Description: This module could be used to get app configuration files,
    /// app initialize process or application session management etc
    func startSplashProcess() {
        
        /*
         let's inform to move forward
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.dismissCoordinator()
        }
    }
    
    func dismissCoordinator() {
        delegate?.dismissCoordinator()
    }
    
}
