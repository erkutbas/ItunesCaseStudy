//
//  CoordinatorDelegate.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {
    func dismissCoordinator()
    func fireAlert(with data: AlertViewData)
}

extension CoordinatorDelegate {
    func fireAlert(with data: AlertViewData) { }
}
