//
//  Album.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 09/10/2022.
//

import Foundation


struct AlbumList: Codable {
    
    let searchResult: [Album]
    
    private enum CodingKeys: String, CodingKey {
        case searchResult = "data"

    }
 
}

struct Album: Codable, Hashable {
    
    let identifier: Int
    let title: String
    let cover: String
    
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "title"
        case cover = "cover"
    }

    
}

struct tracks: Codable {
    
    let data: [Track]
    
}

struct AlbumDetail: Codable {
    
    let tracks: tracks
    
}
