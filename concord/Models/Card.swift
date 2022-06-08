//
//  Card.swift
//  concord
//
//  Created by Yago Marques on 02/06/22.
//

import Foundation

public class Card {
    private(set) var id = UUID()
    var image: String
    var name: String
    var description: String
    var serverUrl: String
    var rate: Int
    var tags: Array<Tag>
    
    init(
        image: String,
        name: String,
        description: String,
        serverUrl: String,
        rate: Int,
        tags: Array<Tag>
    ) {
        self.image = image
        self.name = name
        self.description = description
        self.serverUrl = serverUrl
        self.rate = rate
        self.tags = tags
    }
}


