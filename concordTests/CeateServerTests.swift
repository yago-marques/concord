//
//  CeateServerTests.swift
//  concordTests
//
//  Created by Yago Marques on 15/06/22.
//

import XCTest
@testable import concord

class CeateServerTests: XCTestCase {

    func testInit_validInput_addServer() throws {
        // given
        class ViewControllerMock: CreateServerViewControllerDelegate {
            var target = false
            func addServer(
                name: UITextField?,
                description: UITextField?,
                serverUrl: UITextField?,
                tags: [Tag]
            ) {
                target = true
            }
        }
        let mock = ViewControllerMock()
        let user = UITextField()
        user.text = "user"
        let description = UITextField()
        description.text = "description"
        let serverUrl = UITextField()
        serverUrl.text = "url"
        let rate = UITextField()
        rate.text = "4"
        let tags: [Tag] = []
        // when
        let view = CreateServerViewController(delegate: mock)
        view.delegate?.addServer(
            name: user,
            description: description,
            serverUrl: serverUrl,
            tags: tags
        )
        // then
        XCTAssertTrue(mock.target)
    }
}
