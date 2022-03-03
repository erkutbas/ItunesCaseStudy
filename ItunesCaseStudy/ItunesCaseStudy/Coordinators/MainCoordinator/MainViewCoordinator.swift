//
//  MainViewCoordinator.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit
import DomainLayer

protocol MainViewCoordinatorDelegate: CoordinatorDelegate {
    func fireSelectedItem(with data: ItemDetailData)
}

class MainViewCoordinator: BaseCoordinator {
    
    private var factory = SearchOperationFactory()
    
    override func start() {
        
        let mainViewModel = MainViewModel(useCase: factory.getSearchUseCase(), callBack: ItunesSearchCallBack())
        mainViewModel.delegate = self
        let mainViewController = MainViewController(viewModel: mainViewModel)
        mainViewController.delegate = self
        navigationController.viewControllers = [mainViewController]
        
    }
    
    private func navigateDetailView(with data: ItemDetailData) {
        let coordinator = ItemDetailCoordinator(data: data)
        start(coordinator: coordinator)
        self.navigationController.pushViewController(coordinator.viewContoller, animated: true)
    }
    
}

// MARK: - MainViewCoordinatorDelegate -
extension MainViewCoordinator: MainViewCoordinatorDelegate {
    func dismissCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }

    func fireSelectedItem(with data: ItemDetailData) {
        navigateDetailView(with: data)
    }

}
