//
//  AppCoordinator.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    
    override func start() {
        window.makeKeyAndVisible()
        loadSplashScreen()
    }
    
    private lazy var commonApplicationLauncher: OnDismissed = { [weak self] in
        self?.launchMainProcess()
    }
    
    // MARK: - Splash Screen Implemententations -
    private func loadSplashScreen() {
        removeChildCoordinators()
        let coordinator = SplashScreenCoordinator()
        start(coordinator: coordinator, with: commonApplicationLauncher)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
        
    }
    
    private func launchMainProcess() {
        removeChildCoordinators()

        let coordinator = MainViewCoordinator()
        start(coordinator: coordinator)

        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.navigationController, withAnimation: true)
    }
    
}
