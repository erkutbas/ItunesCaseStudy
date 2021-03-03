//
//  FilterSearchStore.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 28.02.2021.
//

import Foundation

struct FilterSearchStore {
    @UserDefaultWrapper("selectedFilter", defaultValue: MediaItemType.movies.value.metadata)
    static var selectedFilter: String
}
