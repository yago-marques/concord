//
//  Service.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import UIKit

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
    
    func addNewCard(name: UITextField?, description: UITextField?, serverUrl: UITextField?, rate: UITextField?, tags: Array<Tag>) {
        
        guard let cardName = name?.text else { return }
        guard let cardDescription = description?.text else { return }
        guard let cardUrl = serverUrl?.text else { return }
        guard let possibleCardRate = rate?.text else { return }
        guard let cardRate = Int(possibleCardRate) else { return }
        
        let newCard = Card(name: cardName, description: cardDescription, serverUrl: cardUrl, rate: cardRate, tags: tags)
        cardList.append(newCard)
    }
}
