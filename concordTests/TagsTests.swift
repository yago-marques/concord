//
//  TagsTests.swift
//  concordTests
//
//  Created by Marcelo De Araújo on 09/06/22.
//

import XCTest
@testable import concord

class TagsTests: XCTestCase {
    // given
    let user = "user name"
    func testInit_validInputWithNmae_createNewTag() throws {
        // when
        let tagTest = Tag(name: user)
        // when
        XCTAssertEqual(tagTest.name, "user name")
        XCTAssertEqual(isEqual(String(user).self), false)
    }
}
