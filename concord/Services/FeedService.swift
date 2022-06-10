//
//  Service.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import Foundation

class FeedService {
    
    var tagsText: String = ""
    
    var cardList = [
        Card(name: "Apple academy", description: "Um servidor para estudantes do apple academy", serverUrl: "teste", rate: 4, tags: [Tag(name: "Educação"), Tag(name: "Tecnologia")]),
    ]
    
    func getTags(at: Int) -> String {
        for tag in cardList[at].tags {
            tagsText += "#\(tag.name) "
        }
        let result = tagsText
        tagsText = ""
        return result
    }
    
    func addNewCard(name: String, description: String, serverUrl: String, rate: Int, tags: Array<String>) {
        let newCard = Card(name: name, description: description, serverUrl: serverUrl, rate: rate, tags: tags.map {Tag(name: $0)})
        cardList.append(newCard)
    }
}
