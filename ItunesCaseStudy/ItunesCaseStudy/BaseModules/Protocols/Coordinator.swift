//
//  Coordinator.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

public protocol Coordinator: class {

    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }

    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
    
}

