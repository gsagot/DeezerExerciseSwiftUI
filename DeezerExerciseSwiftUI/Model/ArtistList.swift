//
//  Artists.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

struct ArtistList: Codable {
    
    let searchResult: [DZRArtist]
    
    private enum CodingKeys: String, CodingKey {
        case searchResult = "data"

    }
    
}

struct DZRArtist: Codable {
    
    let identifier: Int
    let name: String
    let picture: String
    let tracklist : String
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case picture = "picture_medium"
        case tracklist = "tracklist"
    }

    
}

extension DZRArtist {
    static func mock() -> DZRArtist {
        .init(identifier: 860, name: "Pink Floyd", picture: "https://api.deezer.com", tracklist: "https://api.deezer.com")
    }
    
    static func mocks() -> [DZRArtist] {
        [.init(identifier: 69925, name: "P!nk", picture: "https://api.deezer.com", tracklist: "https://api.deezer.com"),
         .init(identifier: 860, name: "Pink Floyd", picture: "https://api.deezer.com", tracklist: "https://api.deezer.com"),
         .init(identifier: 1074, name: "Pink Martini", picture: "https://api.deezer.com", tracklist: "https://api.deezer.com"),
         .init(identifier: 15320551, name: "Pink Sweat$", picture: "https://api.deezer.com", tracklist: "https://api.deezer.com"),
        ]
    }
}
