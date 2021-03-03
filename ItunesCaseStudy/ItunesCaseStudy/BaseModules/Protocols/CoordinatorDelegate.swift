//
//  CoordinatorDelegate.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 28.02.2021.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {
    func dismissCoordinator()
    func fireAlert(with data: AlertViewData)
}

extension CoordinatorDelegate {
    func fireAlert(with data: AlertViewData) { }
}
