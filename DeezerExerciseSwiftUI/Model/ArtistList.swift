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
