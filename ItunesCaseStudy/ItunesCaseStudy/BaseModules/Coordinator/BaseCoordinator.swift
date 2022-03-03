//
//  BaseCoordinator.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

public class BaseCoordinator: NSObject, Coordinator {

    private var onDismissListener: OnDismissed?
    
    public var navigationController = UINavigationController()
    public var viewContoller = UIViewController()
    public var childCoordinators: [Coordinator] = []
    public var parentCoordinator: Coordinator?
    
    public func start() {
        //fatalError("Start method should be implemented.")
    }
    
    public func start(coordinator: Coordinator) {
        // binary search, tree etc ???
        self.childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    public func start(coordinator: Coordinator, with dismissListener: @escaping OnDismissed) {
        // binary search, tree etc ???
        onDismissListener = dismissListener
        self.childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    public func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    public func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
        onDismissListener?()
    }
    
    public func didFinish(coordinator: Coordinator, completion: OnDismissed) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
            completion()
        }
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    func fireAlert(with data: AlertViewData) {
        
    }
    
}
