//
//  AlertViewModel.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 28.02.2021.
//

import Foundation

class AlertViewModel: BaseViewModelDelegate {
    
    private var data: AlertViewData
    private weak var delegate: AlertViewCoordinatorDelegate?
    
    init(delegate: AlertViewCoordinatorDelegate, data: AlertViewData) {
        self.delegate = delegate
        self.data = data
    }
    
    func getAlertViewData() -> AlertViewData {
        return data
    }

    func dismissCoordinator() {
        delegate?.dismissCoordinator()
    }
    
}
