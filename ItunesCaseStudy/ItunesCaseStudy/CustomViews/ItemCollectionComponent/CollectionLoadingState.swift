//
//  CollectionLoadingState.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 28.02.2021.
//

import Foundation

enum CollectionLoadingState {
    case loading
    case done
    case reloadIndex(IndexPath)
}
