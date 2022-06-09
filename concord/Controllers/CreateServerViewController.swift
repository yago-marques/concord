//
//  CreateServerViewController.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import UIKit

protocol CreateServerViewControllerDelegate {
    func addServer(name: String, description: String, serverUrl: String, rate: Int, tags: Array<String>) 
}

class CreateServerViewController: UIViewController {
    
    // MARK: - Attributes
    var delegate: CreateServerViewControllerDelegate?
    let addTagModal = NewTagViewController()
    
    // MARK: - Constructors
    init(delegate: CreateServerViewControllerDelegate) {
        super.init(nibName: "CreateServerViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Form"
    }
    
    // MARK: - Internal methods
    private func presentModal() {
        if let sheet = addTagModal.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.selectedDetentIdentifier = .medium
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
            present(addTagModal, animated: true)
        }
    }
    
    // MARK: - @IBActions
    @IBAction func showAddTagModal(_ sender: Any) {
        presentModal()
    }
    
}
