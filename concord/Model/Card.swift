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
    
    init(image: String, name: String, description: String, serverUrl: String) {
        self.image = image
        self.name = name
        self.description = description
        self.serverUrl = serverUrl
    }
    
    convenience init(name: String, serverUrl: String) {
        self.init(image: "", name: name, description: "", serverUrl: serverUrl)
    }
    
    convenience init(name: String, description: String, serverUrl: String) {
        self.init(image: "", name: name, description: description, serverUrl: serverUrl)
    }
    
    convenience init(image: String, name: String, serverUrl: String) {
        self.init(image: "", name: name, description: "", serverUrl: serverUrl)
    }
    
}


