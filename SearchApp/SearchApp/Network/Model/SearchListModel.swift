//
//  SearchListModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import Foundation


// MARK: - SearchListResult

struct SearchListResult: Codable {
    let resultCount: Int?
    let results: [SearchList]?
}

// MARK: - Result

struct SearchList: Codable {
    let wrapperType: String?
    let kind: String?
    let artistID, collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let formattedPrice: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice, collectionHDPrice, trackHDPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName, contentAdvisoryRating, shortDescription, longDescription: String?
    let isStreamable: Bool?
    let resultDescription: String?
    let collectionArtistID: Int?
    let collectionArtistName, copyright: String?
    let feedURL: String?
    let trackRentalPrice, trackHDRentalPrice: Double?
    let artworkUrl600: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case formattedPrice, artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, isStreamable
        case resultDescription = "description"
        case collectionArtistID = "collectionArtistId"
        case collectionArtistName, copyright
        case feedURL = "feedUrl"
        case trackRentalPrice
        case trackHDRentalPrice = "trackHdRentalPrice"
        case artworkUrl600
    }
}



