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
        Card(image: "teste", name: "Apple academy", description: "Um servidor para estudantes do apple academy", serverUrl: "teste", rate: 4, tags: [Tag(name: "Educação"), Tag(name: "Tecnologia")]),
    ]
    
    func getTags(at: Int) -> String {
        for tag in cardList[at].tags {
            tagsText += "#\(tag.name) "
        }
        let result = tagsText
        tagsText = ""
        return result
    }
    
    
}
