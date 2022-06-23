//
//  concordUITests.swift
//  concordUITests
//
//  Created by Marcelo De Araújo on 09/06/22
//


import XCTest
@testable import concord

class concordUITests: XCTestCase {

    override func setUpWithError() throws {
        XCTAssertTrue(true)
        XCUIDevice.shared.orientation = .landscapeRight
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
       
    }

    /* func testButtonDisplays() throws {
        let app = XCUIApplication()
        app.launch()

        let window = app.windows

        XCTAssertFalse(window.staticTexts["OK"].exists)

        let button = window.buttons["Novo servidor"]

        button.click()

        XCTAssertTrue(window.staticTexts["Novo servidor"].exists)

        // XCTAssertTrue(app.otherElements.element.exists)

    } */

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
