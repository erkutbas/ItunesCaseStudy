//
//  ItemDetailCoordinator.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

protocol ItemDetailCoordinatorDelegate: CoordinatorDelegate {
    func selfDestroy()
}

class ItemDetailCoordinator: BaseCoordinator {
    
    private(set) var data: ItemDetailData
    
    init(data: ItemDetailData) {
        self.data = data
    }
    
    override func start() {
        guard let itemDetailViewController = ItemDetailViewController.instantiate() else { return }
        itemDetailViewController.viewModel = ItemDetailViewModel(delegate: self, data: data)
        self.viewContoller = itemDetailViewController
    }
    
    override func fireAlert(with data: AlertViewData) {
        super.fireAlert(with: data)
        
        let coordinator = AlertViewCoordinator(data: data)
        start(coordinator: coordinator)
        
        self.viewContoller.present(coordinator.viewContoller, animated: true, completion: nil)
        
    }
    
    deinit {
        print("DEINIT ItemDetailCoordinator")
    }
    
}

extension ItemDetailCoordinator: ItemDetailCoordinatorDelegate {
    func dismissCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    func selfDestroy() {
        self.viewContoller.navigationController?.popViewController(animated: true)
    }
    
}
