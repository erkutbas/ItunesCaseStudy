//
//  AlertViewCoordinator.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 28.02.2021.
//

import Foundation

class AlertViewCoordinator: BaseCoordinator {
    
    private var data: AlertViewData
    
    init(data: AlertViewData) {
        self.data = data
    }
    
    override func start() {
        guard let alertViewController = AlertViewController.instantiate() else { return }
        alertViewController.viewModel = AlertViewModel(delegate: self, data: data)
        alertViewController.modalTransitionStyle = .crossDissolve
        alertViewController.modalPresentationStyle = .overFullScreen
        self.viewContoller = alertViewController
    }
    
}

extension AlertViewCoordinator: AlertViewCoordinatorDelegate {
    func dismissCoordinator() {
        self.viewContoller.dismiss(animated: true, completion: nil)
        parentCoordinator?.didFinish(coordinator: self)
    }
    
}
