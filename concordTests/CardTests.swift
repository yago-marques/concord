//
//  CardTests.swift
//  concordTests
//
//  Created by Marcelo De Araújo on 08/06/22.
//

import XCTest
@testable import concord
import StoreKitTest

class CardTests: XCTestCase {
    // given
    //let image = "this is a image"
    let user = "user name"
    let explanation = "this is a description"
    let serverUrl = "www.servershare.com"
    let rate = 0
    let tags: Array<Tag> = []
    
   /* func testInit_validInputWithImage_createNewCard() throws {
        // when
        let cardTestImage = Card(
            image: image,
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        // then
        XCTAssertEqual(cardTestImage.image, "this is a image")
    }*/
    func testInit_validInputWithName_createNewCard() throws {
        // when
        let cardTestName = Card(
           // image: image,
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        // then
        XCTAssertEqual(cardTestName.name, "user name")
    }
    func testInit_validInputWithDescription_createNewCard() throws {
        // when
        let cardTestDescription = Card(
           // image: image,
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        // then
        XCTAssertEqual(cardTestDescription.description, "this is a description")
    }
    func testInit_validInputWithServerUrl_createNewCard() throws {
        // when
        let cardTestServerUrl = Card(
          //  image: image,
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        // then
        XCTAssertEqual(cardTestServerUrl.serverUrl, "www.servershare.com")
    }
    func testInit_validInputWithRate_createNewCard() throws {
        // when
        let cardTestRate = Card(
          //  image: image,
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        // then
        XCTAssertEqual(cardTestRate.rate, 0)
        XCTAssertEqual(isEqual(Int(rate).self), false)
    }
    func testInit_validInputWithTags_createNewCard() throws {
        // when
        let cardTestTags = Card(
           // image: image,
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        // when
        XCTAssertEqual(cardTestTags.tags.count, 0)
        XCTAssertEqual(isEqual(Array(tags).self), false)
    }
    func testInit_validInputWithId_createNewCard() throws {
        // when
        let cardTestId = Card(
          //  image: image,
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        // then
        XCTAssertTrue(cardTestId.id.uuidString != "")
    }
}
