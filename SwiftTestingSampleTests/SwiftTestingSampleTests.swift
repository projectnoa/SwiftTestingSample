//
//	SwiftTestingSampleTests.swift
//  SwiftTestingSampleTests
//
//  Created by Juan Mueller on 12/2/22.
//  For more, visit www.ajourneyforwisdom.com
//

import XCTest
@testable import SwiftTestingSample

final class SwiftTestingSampleTests: XCTestCase {
    
    // Reference of the view controller that will be subjected to tests
    var sut: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Retrieve a reference of the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Initialize the view controller to be tested
        sut = storyboard.instantiateInitialViewController() as? ViewController
        // Load the view controller if needed
        sut.loadViewIfNeeded()
    }
        
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        // Flush references
        sut = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testResultsAreCalculatedProperly() throws {
        // Wait for 1 second
        sleep(1)
        // Retrieve and validate if the element exists and is setup
        let display = try XCTUnwrap(sut.display, "Display text field not properly setup")
        // Set initial values for the test
        display.text = "5+5"
        sut.numberArray = [5, 5]
        sut.operation = "+"
        // Wait for 1 second
        sleep(1)
        // Trigger operation
        sut.calculateResult()
        // Validate expectation
        XCTAssertEqual(display.text, "10", "Results are not being calculated properly!")
        // Wait for 1 second
        sleep(1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
