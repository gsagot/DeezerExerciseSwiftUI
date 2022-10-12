//
//  AlbumDetail.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation

struct AlbumTracks: Codable {
    
    let data: [Track]
    
}

struct AlbumDetail: Codable {
    
    let tracks: AlbumTracks
    
}
