//
//  ItunesSearchResponse.swift
//  DomainLayer
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation
import NetworkEntityLayer

// MARK: - SearchResponse
public class ItunesSearchResponse: BaseResponse {
    public let resultCount: Int?
    public let results: [ItunesSearchResult]?

    public init(resultCount: Int?, results: [ItunesSearchResult]?) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - Result
public class ItunesSearchResult: Codable {
    public let wrapperType: String?
    public let kind: String?
    public let collectionID, trackID: Int?
    public let artistName, collectionName, trackName, collectionCensoredName: String?
    public let trackCensoredName: String?
    public let collectionArtistID: Int?
    public let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    public let previewURL: String?
    public let artworkUrl30, artworkUrl60, artworkUrl100: String?
    public let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    public let trackHDPrice, trackHDRentalPrice: Double?
    public let releaseDate: String?
    public let collectionExplicitness, trackExplicitness: String?
    public let discCount, discNumber, trackCount, trackNumber: Int?
    public let trackTimeMillis: Int?
    public let country: String?
    public let currency: String?
    public let primaryGenreName: String?
    public let contentAdvisoryRating: String?
    public let longDescription: String?
    public let hasITunesExtras: Bool?
    public let shortDescription: String?
    public let artistID: Int?
    public let artistViewURL: String?
    public let resultDescription, copyright: String?
    public let amgArtistID: Int?
    public let isStreamable: Bool?
    public let collectionArtistName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, longDescription, hasITunesExtras, shortDescription
        case artistID = "artistId"
        case artistViewURL = "artistViewUrl"
        case resultDescription = "description"
        case copyright
        case amgArtistID = "amgArtistId"
        case isStreamable, collectionArtistName
    }

    public init(wrapperType: String?, kind: String?, collectionID: Int?, trackID: Int?, artistName: String?, collectionName: String?, trackName: String?, collectionCensoredName: String?, trackCensoredName: String?, collectionArtistID: Int?, collectionArtistViewURL: String?, collectionViewURL: String?, trackViewURL: String?, previewURL: String?, artworkUrl30: String?, artworkUrl60: String?, artworkUrl100: String?, collectionPrice: Double?, trackPrice: Double?, trackRentalPrice: Double?, collectionHDPrice: Double?, trackHDPrice: Double?, trackHDRentalPrice: Double?, releaseDate: String?, collectionExplicitness: String?, trackExplicitness: String?, discCount: Int?, discNumber: Int?, trackCount: Int?, trackNumber: Int?, trackTimeMillis: Int?, country: String?, currency: String?, primaryGenreName: String?, contentAdvisoryRating: String?, longDescription: String?, hasITunesExtras: Bool?, shortDescription: String?, artistID: Int?, artistViewURL: String?, resultDescription: String?, copyright: String?, amgArtistID: Int?, isStreamable: Bool?, collectionArtistName: String?) {
        self.wrapperType = wrapperType
        self.kind = kind
        self.collectionID = collectionID
        self.trackID = trackID
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
        self.collectionCensoredName = collectionCensoredName
        self.trackCensoredName = trackCensoredName
        self.collectionArtistID = collectionArtistID
        self.collectionArtistViewURL = collectionArtistViewURL
        self.collectionViewURL = collectionViewURL
        self.trackViewURL = trackViewURL
        self.previewURL = previewURL
        self.artworkUrl30 = artworkUrl30
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.trackRentalPrice = trackRentalPrice
        self.collectionHDPrice = collectionHDPrice
        self.trackHDPrice = trackHDPrice
        self.trackHDRentalPrice = trackHDRentalPrice
        self.releaseDate = releaseDate
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.discCount = discCount
        self.discNumber = discNumber
        self.trackCount = trackCount
        self.trackNumber = trackNumber
        self.trackTimeMillis = trackTimeMillis
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.contentAdvisoryRating = contentAdvisoryRating
        self.longDescription = longDescription
        self.hasITunesExtras = hasITunesExtras
        self.shortDescription = shortDescription
        self.artistID = artistID
        self.artistViewURL = artistViewURL
        self.resultDescription = resultDescription
        self.copyright = copyright
        self.amgArtistID = amgArtistID
        self.isStreamable = isStreamable
        self.collectionArtistName = collectionArtistName
    }
}
