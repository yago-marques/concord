//
//  FormService.swift
//  concord
//
//  Created by Yago Marques on 09/06/22.
//

import UIKit

class FormService {
    var myTags: Array<Tag> = []
    
    func addTag(_ name: String) {
        let newTag = Tag(name: name)
        myTags.append(newTag)
    }
}
