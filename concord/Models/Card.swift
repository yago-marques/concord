//
//  Card.swift
//  concord
//
//  Created by Yago Marques on 02/06/22.
//

import UIKit

public class Card {
    private(set) var id = UUID()
    var name: String
    var description: String
    var serverUrl: String
    var rate: Int
    var tags: Array<Tag>
    
    init(
        name: String,
        description: String,
        serverUrl: String,
        rate: Int,
        tags: Array<Tag>
    ) {
        self.name = name
        self.description = description
        self.serverUrl = serverUrl
        self.rate = rate
        self.tags = tags
    }
    
    func getStars() -> String {
        var stars = ""
        for _ in 1...self.rate {
            stars += "⭐️"
        }
        
        return stars
    }
    
    func shareServer() {
        if let myUrl = URL(string: serverUrl) {
            UIApplication.shared.open(myUrl)
        }
    }
}


