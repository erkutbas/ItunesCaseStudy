//
//  MediaItemType.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 3.03.2021.
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
            return MediaTypeData(index: 0, title: "Movies", metadata: "movie")
        case .music:
            return MediaTypeData(index: 1, title: "Music", metadata: "music")
        case .app:
            return MediaTypeData(index: 2, title: "Apps", metadata: "software")
        case .books:
            return MediaTypeData(index: 3, title: "Books", metadata: "audiobooks")
        }
    }
}
