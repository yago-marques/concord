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
    @IBOutlet weak var rateNameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var tagsTextView: UITextView!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var evaluateButton: UIButton!
    
    // MARK: - @IBActions
    @IBAction func shareServerButton(_ sender: Any) {
        print("teste")
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rateLabel.textColor = Colors.primaryColor
        rateNameLabel.textColor = Colors.primaryColor
        enterButton.tintColor = ColorCompatibility.joinButtonColor
        evaluateButton.tintColor = Colors.secondaryLightColor
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        enterButton.tintColor = ColorCompatibility.joinButtonColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }
    
}
