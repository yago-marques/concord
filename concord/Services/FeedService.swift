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
    
    func addNewCard(name: UITextField?, description: UITextField?, serverUrl: UITextField?, rate: UITextField?, tags: Array<Tag>, controller: UIViewController) {

        guard let cardName = name?.text, cardName != "" else {
            ErrorAlertView(message: "Preencha o campo nome", controller: controller, defaultActionName: "OK").showWithoutHandler()
            return
        }
        guard let cardDescription = description?.text, cardDescription != "" else {
            ErrorAlertView(message: "Preencha o campo descrição", controller: controller, defaultActionName: "OK").showWithoutHandler()
            return
        }
        guard let cardUrl = serverUrl?.text, cardUrl != "" else {
            ErrorAlertView(message: "Preencha o campo Link", controller: controller, defaultActionName: "OK").showWithoutHandler()
            return
        }
        guard let possibleCardRate = rate?.text, possibleCardRate != "" else {
            ErrorAlertView(message: "Avaliação vazia", controller: controller, defaultActionName: "OK").showWithoutHandler()
            return
        }
        guard let cardRate = Int(possibleCardRate) else {
            ErrorAlertView(message: "Avaliação inválida", controller: controller, defaultActionName: "OK").showWithoutHandler()
            return
        }
        
        let newCard = Card(name: cardName, description: cardDescription, serverUrl: cardUrl, rate: cardRate, tags: tags)
        cardList.append(newCard)
    }
}
