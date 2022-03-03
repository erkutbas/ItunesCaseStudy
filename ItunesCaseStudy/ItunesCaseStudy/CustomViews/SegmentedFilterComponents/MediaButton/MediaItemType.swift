//
//  MediaItemType.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

enum MediaItemType: GenericValueProtocol {
    typealias Value = MediaTypeData
    
    case movies
    case music
    case app
    case books
    
    var value: MediaTypeData {
        switch self {
        case .movies:
            return MediaTypeData(index: 0, title: FilterViewLocalizables.movie.value, metadata: "movie")
        case .music:
            return MediaTypeData(index: 1, title: FilterViewLocalizables.music.value, metadata: "music")
        case .app:
            return MediaTypeData(index: 2, title: FilterViewLocalizables.app.value, metadata: "software")
        case .books:
            return MediaTypeData(index: 3, title: FilterViewLocalizables.book.value, metadata: "audiobook")
        }
    }
}
