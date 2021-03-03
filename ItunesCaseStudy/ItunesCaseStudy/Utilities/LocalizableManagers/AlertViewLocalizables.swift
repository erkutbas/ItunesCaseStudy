//
//  AlertViewLocalizables.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 28.02.2021.
//

import Foundation

enum AlertViewLocalizables: GenericValueProtocol {
    typealias Value = String

    case warningTitle
    case warningSubTitle
    case okButton
    case cancelButton
    
    var value: String {
        switch self {
        case .warningTitle:
            return "warningTitle".toLocalize()
        case .warningSubTitle:
            return "warningSubTitle".toLocalize()
        case .okButton:
            return "okButton".toLocalize()
        case .cancelButton:
            return "cancelButton".toLocalize()
        }
    }
}
