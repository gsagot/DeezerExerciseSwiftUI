//
//  FakePreviewResponseData.swift
//  DeezerExerciseSwiftUITests
//
//  Created by Gilles Sagot on 14/10/2022.
//

import Foundation

class FakePreviewResponseData {
    // MARK: - URL
    static var CorrectLocation: URL? {
        let bundle = Bundle(for: FakePreviewResponseData.self)
        let url = bundle.url(forResource: "c-a1a592f0d70f7e944b088f0070be9342-4", withExtension: "mp3")!
        return url
    }

    static let IncorrectLocation = URL(string: "badURL.com")
    

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
