//
//  DZRArtist+Extension.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

extension DZRArtist {
    static func mock() -> DZRArtist {
        .init(identifier: 5, name: "Jamiroquai", picture: String("jamiroquai"), tracklist: "https://api.deezer.com")
    }
    
    static func mocks() -> [DZRArtist] {
        [.init(identifier: 1, name: "The Beatles", picture: String("beatles"), tracklist: "https://api.deezer.com"),
         .init(identifier: 2, name: "Manu Chao", picture: String("manuchao"), tracklist: "https://api.deezer.com"),
         .init(identifier: 3, name: "Metallica", picture: String("metallica"), tracklist: "https://api.deezer.com"),
         .init(identifier: 4, name: "Nirvana", picture: String("nirvana"), tracklist: "https://api.deezer.com"),
        ]
    }
}
