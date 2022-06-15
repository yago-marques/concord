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
    //given
    let myTagsTest = [Tag(name: "tests")]
    func testInit_validInputWithMyTags_createNewFormService() throws {
        //when
        let myTagsTest = FormService()
        XCTAssertEqual(isEqual(Array<Tag>(_immutableCocoaArray: myTagsTest).self), false)
    }
    func testAddTag_validInput_addNewTagInList() throws {
        // given
        let myTags: Array<Tag> = []
        // when
        let service = FormService()
        // then
        XCTAssertEqual(isEqual(Array(myTags).self), false)
    }
}
