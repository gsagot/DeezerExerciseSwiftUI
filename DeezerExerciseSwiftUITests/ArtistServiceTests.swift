//
//  APIRequesterTests.swift
//  DeezerExerciseSwiftUITests
//
//  Modified by Gilles Sagot on 08/10/2022.

import XCTest

@testable import DeezerExerciseSwiftUI

class ArtistServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(URLProtocolFake.self)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchArtistShouldPostFailedCallbackIfError() {

        // GIVEN
        URLProtocolFake.request = { request in
            let data: Data? = nil
            let response: HTTPURLResponse? = nil
            let error: Error? = FakeArtistResponseData.error
            return (data, response, error)
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolFake.self]
        
        let session = URLSession(configuration: configuration)
        let apiService = ArtistService(session: session)
        
        // WHEN
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        apiService.searchArtist(url: URL(string: "https://api.deezer.com")! ){ result in
            
            // THEN
            switch result {
                
            case .success(_):
                break
            case .failure(let error):
                XCTAssertEqual(error, .DataException("No Data, please check your Internet connection") )
            }
            expectation.fulfill()
        }
            
        wait(for: [expectation], timeout: 1)
 
    }
    
    func testSearchArtistShouldPostFailedCallbackIfNoData() {
        
        // GIVEN
        URLProtocolFake.request = { request in
            let data: Data? = nil
            let response: HTTPURLResponse? = nil
            let error: Error? = nil
            return (data, response, error)
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolFake.self]
        
        let session = URLSession(configuration: configuration)
        let apiService = ArtistService(session: session)
        
        // WHEN
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        apiService.searchArtist(url: URL(string: "https://api.deezer.com")! ){ result in
            
        // THEN
            switch result {
                
            case .success(_):
                break
            case .failure(let error):
                XCTAssertEqual(error, .DataException("No Data, please check your Internet connection") )
                
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
 
    }
    
    func testSearchArtistShouldPostSuccessCallbackIfCorrectResponseWithData() {
        
        // GIVEN
        URLProtocolFake.request = { request in
            let data: Data? = FakeArtistResponseData.CorrectData
            let response: HTTPURLResponse? = FakeArtistResponseData.responseOK
            let error: Error? = nil
            return (data, response, error)
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolFake.self]
        
        let session = URLSession(configuration: configuration)
        let apiService = ArtistService(session: session)
        
        // WHEN
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        apiService.searchArtist(url: URL(string: "https://api.deezer.com")! ){ result in
            
        // THEN
            switch result {

            case .success(let artists):
                XCTAssert(artists.searchResult.first?.identifier == 69925 )
            case .failure(_):
                break
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)

    }
    
    

}
