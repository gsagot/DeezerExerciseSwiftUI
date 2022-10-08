//
//  Requester.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

// MARK: - REQUESTER PROTOCOL

protocol Requester {
    func searchArtist(url: URL, completion: @escaping (Bool, Artists?) -> ())
}
