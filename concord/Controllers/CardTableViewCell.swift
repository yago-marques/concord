//
//  CardTableViewCell.swift
//  concord
//
//  Created by Yago Marques on 08/06/22.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var tagsTextView: UITextView!
    
    // MARK: - @IBActions
    @IBAction func shareServerButton(_ sender: Any) {
        print("teste")
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
