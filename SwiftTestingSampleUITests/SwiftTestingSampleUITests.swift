//
//	SwiftTestingSampleUITests.swift
//  SwiftTestingSampleUITests
//
//  Created by Juan Mueller on 12/2/22.
//  For more, visit www.ajourneyforwisdom.com
//

import XCTest

final class SwiftTestingSampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        //let app = XCUIApplication()
        //app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testResultsAreCalculatedProperly() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Set initial values for the test
        // Wait for 1 second
        sleep(1)
        // Trigger a button tap event
        app.buttons["5"].tap()
        // Wait for 1 second
        sleep(1)
        // Trigger a button tap event
        app.buttons["+"].tap()
        // Wait for 1 second
        sleep(1)
        // Trigger a button tap event
        app.buttons["5"].tap()
        // Wait for 1 second
        sleep(1)
        // Trigger a button tap event
        app.buttons["="].tap()
        // Wait for 1 second
        sleep(1)
        // Retrieve an element from the app current instance
        let display = app.staticTexts.element(matching: .any, identifier: "display")
        // Validate expectation
        XCTAssertEqual(display.label, "10", "Results are not being calculated properly!")
        // Wait for 1 second
        sleep(1)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
