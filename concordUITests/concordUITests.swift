//
//  concordUITests.swift
//  concordUITests
//
//  Created by Marcelo De Araújo on 09/06/2022
//


import XCTest
@testable import concord

class concordUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        XCTAssertTrue(true)
        XCUIDevice.shared.orientation = .landscapeRight
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
       
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

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
