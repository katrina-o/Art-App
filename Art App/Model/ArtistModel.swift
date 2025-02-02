//
//  ArtistModel.swift
//  Art App
//
//  Created by Катя on 19.09.2024.
//

import Foundation

struct ArtistModel: Decodable {
    var artists: [InfoArtistModel]
}

struct InfoArtistModel: Decodable {
    var name: String
    var bio: String
    var image: String
    var works: [WorksArtistModel]
}

struct WorksArtistModel: Decodable {
    var title: String
    var image: String
    var info: String
}
