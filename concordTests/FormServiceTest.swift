//
//  FormServiceTest.swift
//  concordTests
//
//  Created by Marcelo De Araújo on 10/06/22.
//

import XCTest
@testable import concord
import StoreKitTest

class FormServiceTest: XCTestCase {
    // given
    let myTagsTest = [Tag(name: "tests")]

    func testInit_validInputWithMyTags_createNewFormService() throws {
        // when
        let myTagsTest = FormService()
        XCTAssertEqual(isEqual([Tag](_immutableCocoaArray: myTagsTest).self), false)
    }

    func testAddTag_validInput_addNewTagInList() throws {
        // given
        let myTags: [Tag] = []
        let nameTest = UITextField()
        let userTest = UITextField()
        let testService = FormService()
        let testService1 = FormService()

        // when
        nameTest.text = "user"
        userTest.text = "user1"
        testService.addTag(nameTest)
        let string = testService1.TextField(for: userTest)

        // then
        XCTAssertEqual(isEqual(Array(myTags).self), false)
        XCTAssertEqual(nameTest.text, "user")
        XCTAssertEqual(userTest.text, "user1")
        XCTAssertEqual(userTest.text, string)
    }

    func testAddTag_textFieldNil_dontAppendMyTags() throws {
        // given
        let formService = FormService()

        // when
        formService.addTag(nil)

        // then
        XCTAssert(formService.myTags.isEmpty)
    }

    func testAddTag_textFieldNil_returnEmptyString() {
        // given
        let formService = FormService()
        let expectedResult = String()

        // when
        let string = formService.TextField(for: nil)

        // then
        XCTAssertEqual(string, expectedResult)
    }
}
