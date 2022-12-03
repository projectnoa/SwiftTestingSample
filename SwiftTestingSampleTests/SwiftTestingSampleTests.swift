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
    
    var sut: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateInitialViewController() as? ViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
    }

    func testResultsAreCalculatedProperly() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        sleep(1)
        
        let display = try XCTUnwrap(sut.display, "Display text field not properly setup")
        
        display.text = "5+5"
        
        sut.numberArray = [5, 5]
        sut.operation = "+"
        
        sleep(1)
        
        sut.calculateResult()
        
        XCTAssertEqual(display.text, "10", "Results are not being calculated properly!")
        
        sleep(1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
