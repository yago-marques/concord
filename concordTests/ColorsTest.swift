//
//  ColorsTest.swift
//  concordTests
//
//  Created by Marcelo De Araújo on 23/06/22.
//

import XCTest
@testable import concord

class ColorsTest: XCTestCase {

    func testColors() throws {

        XCTAssertEqual(Colors.primaryColor, UIColor(red: 0.50, green: 0.37, blue: 0.75, alpha: 1.0))
        XCTAssertEqual(Colors.primaryLightColor, UIColor(red: 0.70, green: 0.55, blue: 0.95, alpha: 1.0))
        XCTAssertEqual(Colors.primaryDarkColor, UIColor(red: 0.31, green: 0.20, blue: 0.56, alpha: 1.0))
        XCTAssertEqual(Colors.primaryTextColor, UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0))
        XCTAssertEqual(Colors.secondaryColor, UIColor(red: 0.18, green: 0.19, blue: 0.26, alpha: 1.0))
        XCTAssertEqual(Colors.secondaryLightColor, UIColor(red: 0.34, green: 0.35, blue: 0.43, alpha: 1.0))
    }
}
