//
//  NewTagViewController.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import UIKit

protocol NewTagViewControllerDelegate {
    func addTag(name: UITextField?)
}

class NewTagViewController: UIViewController {
    
    // MARK: - Attributes
    lazy var cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToForm))
    let service = FormService()
    let delegate: NewTagViewControllerDelegate
    
    // MARK: - @IBOutlets
    @IBOutlet weak var tagNameTextField: UITextField?

    // MARK: - Constructors
    init(delegate: NewTagViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewTagViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = cancelButton
    }

    // MARK: - Internal methods
    @objc func backToForm() {
        navigationController?.dismiss(animated:true)
    }
    
    // MARK: - @IBActions
    @IBAction func addTagButton(_ sender: Any) {
        if service.TextField(for: tagNameTextField) != "" {
            delegate.addTag(name: tagNameTextField)
            tagNameTextField?.text = ""
        } else {
            ErrorAlertView(message: "Tag vazia", controller: self, defaultActionName: "OK").showWithoutHandler()
        }
    }
    
}
