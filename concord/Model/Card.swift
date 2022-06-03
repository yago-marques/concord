//
//  Card.swift
//  concord
//
//  Created by Yago Marques on 02/06/22.
//

import Foundation

public class Card {
    private(set) var id = UUID()
    var image: String?
    var name: String
    var description: String?
    var serverUrl: String
    
    init(image: String? = nil, name: String, description: String? = nil, serverUrl: String) {
        self.image = image
        self.name = name
        self.description = description
        self.serverUrl = serverUrl
    }
}


