//
//  Requester.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

// MARK: - REQUESTER PROTOCOL

protocol ArtistRequester {
    func searchArtist(url: URL, completion: @escaping (Bool, ArtistList?) -> Void)
}

protocol TrackRequester {
    func get(url: URL, completion: @escaping (Result<TrackList,ServiceError>) -> Void)
}

protocol AlbumRequester {
    func get(url: URL, completion: @escaping (Result<AlbumDetail,ServiceError>) -> Void)
}

protocol PreviewRequester {
    func getAudioFile(url: URL, completion: @escaping (Result<URL,Error>) -> Void)
}
