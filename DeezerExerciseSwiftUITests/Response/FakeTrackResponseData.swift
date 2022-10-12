//
//  FakeTrackResponseData.swift
//  DeezerExerciseSwiftUITests
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation

class FakeTrackResponseData {
    // MARK: - DATA
    static var CorrectData: Data? {
        let bundle = Bundle(for: FakeArtistResponseData.self)
        let url = bundle.url(forResource: "TrackList", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    static let IncorrectData = "erreur".data(using: .utf8)!
    

    // MARK: - SERVER RESPONSE
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://api.deezer.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://api.deezer.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!


    // MARK: - SERVER ERROR
    class FakeError: Error {}
    static let error = FakeError()

    
}
