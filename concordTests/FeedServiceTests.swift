//
//  FeedServiceTests.swift
//  concordTests
//
//  Created by Marcelo De Araújo on 09/06/22.
//

import XCTest
@testable import concord
import StoreKitTest

class FeedServiceTests: XCTestCase {

    // given
    let user = "user name"
    let explanation = "this is a description"
    let serverUrl = "www.servershare.com"
    let rate = 0
    let tags: Array<Tag> = []
    
    func testInit_validInput_createNewFeedService() throws {
        // when
        let cardTest = Card(
            name: user,
            description: explanation,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        let tagsText = "this is a test"
        let cardList = [cardTest]
        // then
        XCTAssertEqual(cardTest.name, "user name")
        XCTAssertEqual(cardTest.description, "this is a description")
        XCTAssertEqual(cardTest.serverUrl, "www.servershare.com")
        XCTAssertEqual(cardTest.rate, 0)
        XCTAssertEqual(isEqual(Int(rate).self), false)
        XCTAssertEqual(cardTest.tags.count, 0)
        XCTAssertEqual(isEqual(Array(tags).self), false)
        XCTAssertTrue(cardTest.id.uuidString != "")
        XCTAssertEqual(tagsText, "this is a test")
        XCTAssertEqual(isEqual(String(tagsText).self), false)
        XCTAssertEqual(isEqual(Array(cardList).self), false)
    }
    func testAddNewCard_validInput_addNewCardInList() throws {
        // given
        let view = UIViewController()
        
        let user = UITextField()
        user.text = "user"
        
        let description = UITextField()
        description.text = "description"
        
        let serverUrl = UITextField()
        serverUrl.text = "serverUrl"
        
        let rate = UITextField()
        rate.text = "4"
        
        let tags: Array<Tag> = []
        // When
        let service = FeedService()
        let lastCount = service.cardList.count
        service.addNewCard(
            name: user,
            description: description,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags,
            controller: view
        )
        //then
        XCTAssertTrue(service.cardList.count != lastCount)
    }
}
