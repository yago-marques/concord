//
//  FeedTableViewController.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import UIKit

class FeedTableViewController: UITableViewController, CreateServerViewControllerDelegate {
    
    // MARK: - Attributes
    let service = FeedService()
   
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        cardTableViewCells()
        let buttonToAddCard = UIBarButtonItem(title: "Novo servidor", style: .plain, target: self, action: #selector(showServerForm))
        navigationItem.rightBarButtonItem = buttonToAddCard
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Concord"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    // MARK: - Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.cardList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell") as? CardTableViewCell {
            let object = service.cardList[indexPath.row]
            cell.nameLabel.text = object.name
            cell.descriptionTextView.text = object.description
            cell.rateLabel.text = String(object.rate)
            cell.tagsTextView.text = service.getTags(at: indexPath.row)
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderTableView", owner: self)?.first as! HeaderTableView
        headerView.headerConfig()
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    // MARK: - Internal Methods
    private func cardTableViewCells() {
        let cardCell = UINib(nibName: "CardTableViewCell",
                                  bundle: nil)
        self.tableView.register(cardCell, forCellReuseIdentifier: "CardTableViewCell")
    }
    
    @objc func showServerForm() {
        let CreateServerViewController = CreateServerViewController(delegate: self)
        navigationController?.pushViewController(CreateServerViewController, animated: true)
    }
    
    func addServer(name: UITextField?, description: UITextField?, serverUrl: UITextField?, rate: UITextField?, tags: Array<Tag>) {
        service.addNewCard(name: name, description: description, serverUrl: serverUrl, rate: rate, tags: tags, controller: self)
        tableView.reloadData()
    }
}
