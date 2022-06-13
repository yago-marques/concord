//
//  ErrorAlertView.swift
//  concord
//
//  Created by Yago Marques on 13/06/22.
//

import UIKit

class ErrorAlertView {
    private let title: String
    private let message: String
    private let controller: UIViewController
    private let alert: UIAlertController
    private let defaultActionName: String
    
    init(title: String = "Erro", message: String = "Houve um erro", controller: UIViewController, defaultActionName: String = "Cancel") {
        self.title = title
        self.message = message
        self.controller = controller
        self.defaultActionName = defaultActionName
        self.alert = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
    }
    
    func showWithoutHandler() {
        let cancelButton = UIAlertAction(title: defaultActionName, style: .cancel)
        alert.addAction(cancelButton)
        controller.present(alert, animated: true)
    }
}
