//
//  Requester.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

// MARK: - REQUESTER PROTOCOL

protocol Requester {
    func search<T:Codable>(url: URL, completion: @escaping (Result<T,ServiceError>) -> Void)
}

