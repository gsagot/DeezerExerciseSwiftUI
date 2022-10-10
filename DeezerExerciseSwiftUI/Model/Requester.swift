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
    func getArtistTopTracks(url: URL, completion: @escaping (Result<TrackList,ServiceError>) -> Void)
}

protocol AlbumDetailRequester {
    func getAlbumDetail(url: URL, completion: @escaping (Result<AlbumDetail,ServiceError>) -> Void)
}
