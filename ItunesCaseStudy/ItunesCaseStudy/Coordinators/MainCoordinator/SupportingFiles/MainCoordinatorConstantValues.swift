//
//  MainCoordinatorConstantValues.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 3.03.2021.
//

import UIKit

typealias SizeValues = MainCoordinatorConstantValues.SizeValues

enum MainCoordinatorConstantValues {

    enum SizeValues: GenericValueProtocol {
        typealias Value = CGSize
        
        case segmentedButtonSize
        
        var value: CGSize {
            switch self {
            case .segmentedButtonSize:
                return CGSize(width: UIScreen.main.bounds.width - 40, height: 0)
            }
        }
    }
    
}
