//
//  Track.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 09/10/2022.
//

import Foundation

struct TrackList: Codable {
    
    let searchResult: [Track]
    
    private enum CodingKeys: String, CodingKey {
        case searchResult = "data"

    }
 
}

struct Track: Codable, Comparable {
    
    static func < (lhs: Track, rhs: Track) -> Bool {
        return lhs.identifier < rhs.identifier
    }
    
    static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
    let identifier: Int
    let title: String
    let link: String
    let album: Album
    let preview: String
     
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "title"
        case link = "link"
        case album = "album"
        case preview = "preview"
         
    }

    
}
