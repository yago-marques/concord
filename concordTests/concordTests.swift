//
//  concordTests.swift
//  concordTests
//
//  Created by Yago Marques on 02/06/22.
//

import XCTest
@testable import concord

class concordTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCardInit_validInput_createNewCard() throws {
        // given
        let image = "this is a image"
        let name = "user name"
        let description = "this is a description"
        let serverUrl = "www.servershare.com"
        
        // when
        let card01 = Card(image: image, name: name, description: description, serverUrl: serverUrl)
        let card02 = Card(name: name, description: description, serverUrl: serverUrl)
        let card03 = Card(image: image, name: name, serverUrl: serverUrl)
        let card04 = Card(name: name, serverUrl: serverUrl)
        
        
        // then
        // card01
        XCTAssertEqual(card01.image, "this is a image")
        XCTAssertEqual(card01.name, "user name")
        XCTAssertEqual(card01.description, "this is a description")
        XCTAssertEqual(card01.serverUrl, "www.servershare.com")
        XCTAssertTrue(card01.id.uuidString != "")
        
        // card02
        XCTAssertNil(card02.image)
        XCTAssertEqual(card02.name, "user name")
        XCTAssertEqual(card02.description, "this is a description")
        XCTAssertEqual(card02.serverUrl, "www.servershare.com")
        XCTAssertTrue(card02.id.uuidString != "")
        
        // card03
        XCTAssertEqual(card03.image, "this is a image")
        XCTAssertEqual(card03.name, "user name")
        XCTAssertNil(card03.description)
        XCTAssertEqual(card03.serverUrl, "www.servershare.com")
        XCTAssertTrue(card03.id.uuidString != "")
        
        // card04
        
        XCTAssertNil(card04.image)
        XCTAssertEqual(card04.name, "user name")
        XCTAssertNil(card04.description)
        XCTAssertEqual(card04.serverUrl, "www.servershare.com")
        XCTAssertTrue(card04.id.uuidString != "")
        
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            
            // Put the code you want to measure the time of here.
        }
    }

}
