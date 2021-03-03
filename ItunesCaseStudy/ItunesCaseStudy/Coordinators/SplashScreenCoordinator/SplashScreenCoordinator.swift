//
//  SplashScreenCoordinator.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation

class SplashScreenCoordinator: BaseCoordinator {

    override func start() {
        guard let viewController = SplashScreenViewController.instantiate() else { return }
        viewController.viewModel = SplashScreenViewModel(delegate: self)
        self.viewContoller = viewController
    }
    
    deinit {
        print("DEINIT SplashScreenCoordinator")
    }
    
}

extension SplashScreenCoordinator: SplashScreenCoordinatorDelegate {
    func dismissCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
}
