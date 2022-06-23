//
//  FeedTableViewControllerTests.swift
//  concordTests
//
//  Created by Marcelo De Araújo on 21/06/22.
//

import XCTest
@testable import concord

class FeedTableViewControllerTests: XCTestCase {

    func testInit_validInput_showServerFormTest() {

        class FeedTableViewControllerMock: CreateServerViewControllerDelegate {
            var target = false
            func addServer(
                name: UITextField?,
                description: UITextField?,
                serverUrl: UITextField?,
                rate: UITextField?,
                tags: Array<Tag>) {
                    target = true
            }
        }
        let mock = FeedTableViewControllerMock()
        let user = UITextField()
        user.text = "user"
        let description = UITextField()
        description.text = "description"
        let serverUrl = UITextField()
        serverUrl.text = "url"
        let rate = UITextField()
        rate.text = "4"
        let tags: [Tag] = []

        let view = CreateServerViewController(delegate: mock)
        view.delegate?.addServer(
            name: user,
            description: description,
            serverUrl: serverUrl,
            rate: rate,
            tags: tags)
        XCTAssertTrue(mock.target)
        
    }

}
