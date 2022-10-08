//
//  Artists.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

struct Artists: Codable {
    
    let searchResult: [DZRArtist]
    
    private enum CodingKeys: String, CodingKey {
        case searchResult = "data"

    }
    
}
