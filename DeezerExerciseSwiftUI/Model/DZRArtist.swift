//
//  DZRArtist.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

struct DZRArtist: Codable {
    
    let identifier: Int
    let name: String
    let picture: String
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case picture = "picture_small"
    }

    
}

