//
//  CreateServerViewController.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import UIKit

protocol CreateServerViewControllerDelegate {
    func addServer(name: UITextField?, description: UITextField?, serverUrl: UITextField?, rate: UITextField?, tags: Array<Tag>) 
}

class CreateServerViewController: UIViewController, NewTagViewControllerDelegate {
    
    // MARK: - Attributes
    var delegate: CreateServerViewControllerDelegate?
    lazy var addTagModal = NewTagViewController(delegate: self)
    let service = FormService()
    
    // MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var descriptionTextField: UITextField?
    @IBOutlet weak var rateTextField: UITextField?
    @IBOutlet weak var serverUrlTextField: UITextField?
    
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
        self.navigationController?.navigationBar.prefersLargeTitles = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    // MARK: - Internal methods
    private func presentModal() {
        let nav = UINavigationController(rootViewController: addTagModal)
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.selectedDetentIdentifier = .medium
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
            present(nav, animated: true)
        }
    }
    
    func addTag(name: UITextField?) {
        service.addTag(name)
        dismiss(animated: true)
        tableView.reloadData()
    }
    
    // MARK: - @IBActions
    @IBAction func showAddTagModal(_ sender: Any) {
        presentModal()
    }
    @IBAction func createCardButton(_ sender: Any) {
        delegate?.addServer(name: nameTextField, description: descriptionTextField, serverUrl: serverUrlTextField, rate: rateTextField, tags: service.myTags)
        navigationController?.popViewController(animated: true)
    }
    
}

extension CreateServerViewController: UITableViewDelegate { }

extension CreateServerViewController: UITableViewDataSource {
    // MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        service.myTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let content = service.myTags[indexPath.row].name
        cell.textLabel?.text = content
        cell.accessoryType = .checkmark
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let possibelCell = tableView.cellForRow(at: indexPath)
        guard let cell = possibelCell else { return }
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
    }
}
