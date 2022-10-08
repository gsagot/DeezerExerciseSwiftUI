//
//  DZRArtist+Extension.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

extension DZRArtist {
    static func mock() -> DZRArtist {
        .init(identifier: 5, name: "Jamiroquai", picture: String("jamiroquai"))
    }
    
    static func mocks() -> [DZRArtist] {
        [.init(identifier: 1, name: "The Beatles", picture: String("beatles")),
         .init(identifier: 2, name: "Manu Chao", picture: String("manuchao")),
         .init(identifier: 3, name: "Metallica", picture: String("metallica")),
         .init(identifier: 4, name: "Nirvana", picture: String("nirvana")),
        ]
    }
}
