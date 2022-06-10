//
//  FormService.swift
//  concord
//
//  Created by Yago Marques on 09/06/22.
//

import UIKit

class FormService {
    var myTags: Array<Tag> = [
        Tag(name: "teste")
    ]
    
    func addTag(_ possibleName: UITextField?) {
        
        guard let name = possibleName?.text else { return }
        
        let newTag = Tag(name: name)
        myTags.append(newTag)
    }
    
    func TextField(for label: UITextField?) -> String {
        guard let string = label?.text else { return String() }
        return string
    }
}
