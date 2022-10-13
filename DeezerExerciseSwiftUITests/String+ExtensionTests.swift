//
//  String+ExtensionTests.swift
//  DeezerExerciseSwiftUITests
//
//  Created by Gilles Sagot on 13/10/2022.
//

import XCTest

@testable import DeezerExerciseSwiftUI

final class String_ExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGivenStringWithParenthesesShouldReturnStringWithoutParentheses() {
        
        let string = "Hey You (2011 Remastered Version)"
        
        let result = string.removeParentheses()

        XCTAssert(result == "Hey You ")
    }
    
    func testGivenStringWithoutParenthesesShouldReturnSameString() {
        
        let string = "Another Brick In The Wall, Pt. 2"
        
        let result = string.removeParentheses()

        XCTAssert(result == "Another Brick In The Wall, Pt. 2")
    }
    
    func testGivenStringWithSpaceShouldReturnStringWithPercentEncoding() {
        
        let string = "Pink Floyd"
        
        let result = string.trimmedAndEscaped()

        XCTAssert(result == "Pink%20Floyd")
    }
    
    func testGivenStringWithoutSpaceShouldReturnSameString() {
        
        let string = "PinkFloyd"
        
        let result = string.trimmedAndEscaped()

        XCTAssert(result == "PinkFloyd")
    }
    
    
    
    

}
