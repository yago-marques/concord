//
//  CreateServerViewController.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import UIKit

protocol CreateServerViewControllerDelegate {
    func addServer(name: UITextField?, description: UITextField?, serverUrl: UITextField?, tags: Array<Tag>)
}

class CreateServerViewController: UIViewController {
    
    // MARK: - Attributes
    var delegate: CreateServerViewControllerDelegate?
    lazy var addTagModal = NewTagViewController(delegate: self)
    lazy var service = FormService(delegate: self)
    
    // MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var descriptionTextField: UITextField?
    @IBOutlet weak var serverUrlTextField: UITextField?
    @IBOutlet weak var createCardButton: UIButton!
    
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
        self.title = "Novo servidor"
        tableView.dataSource = self
        tableView.delegate = self
        
        createCardButton.tintColor = Colors.primaryColor
    }
    
    
    // MARK: - Internal methods
    @objc private func showDeleteModal(_ gesture: UIGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let tag = service.myTags[indexPath.row]
            
            let popUp = UIAlertController(title: tag.name, message: "", preferredStyle: .alert)
            let buttonToOk = UIAlertAction(title: "OK", style: .cancel)
            let buttonToRemove = UIAlertAction(title: "Remover", style: .destructive) { tag in
                self.service.myTags.remove(at: indexPath.row)
            }
            
            popUp.addAction(buttonToOk)
            popUp.addAction(buttonToRemove)
            
            present(popUp, animated: true)
        }
    }
    
    // MARK: - @IBActions
    @IBAction func createCardButton(_ sender: Any) {
        delegate?.addServer(name: nameTextField, description: descriptionTextField, serverUrl: serverUrlTextField, tags: service.myTags)
        navigationController?.popViewController(animated: true)
    }
    
}

extension CreateServerViewController: UITableViewDelegate { }

extension CreateServerViewController: UITableViewDataSource {
    // MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        service.myTags.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CreateTagHeaderView(delegate: self)
        header.start()
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let content = service.myTags[indexPath.row].name
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDeleteModal))
        cell.textLabel?.text = content
        cell.accessoryType = .checkmark
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let possibelCell = tableView.cellForRow(at: indexPath)
        guard let cell = possibelCell else { return }
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            service.myTags.remove(at: indexPath.row)
        }
    }
}

extension CreateServerViewController: NewTagViewControllerDelegate {
    func addTag(name: UITextField?) {
        service.addTag(name)
        dismiss(animated: true)
    }
}

extension CreateServerViewController: FormServiceDelegate {
    func update() {
        tableView.reloadData()
    }
}

extension CreateServerViewController: CreateTagHeaderViewDelegate {
    @objc func presentModal() {
        let nav = UINavigationController(rootViewController: addTagModal)
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.selectedDetentIdentifier = .medium
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
            present(nav, animated: true)
        }
    }
}
