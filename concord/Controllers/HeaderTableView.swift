//
//  HeaderTableViewController.swift
//  concord
//
//  Created by Yago Marques on 19/06/22.
//

import UIKit

class HeaderTableView: UIView {

    @IBOutlet weak var HeaderBgView: UIView!
    @IBOutlet weak var mainShapeView: UIView!
    @IBOutlet weak var rightShapeView: UIView!
    
    private let color = Colors()
    
    func headerConfig() {
        HeaderBgView.backgroundColor = color.secondaryColor
        
        mainShapeView.backgroundColor = color.primaryDarkColor
        
        rightShapeView.backgroundColor = color.primaryLightColor
        
        HeaderBgView.layer.cornerRadius = 2500
        HeaderBgView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        mainShapeView.layer.cornerRadius = 10
        mainShapeView.layer.masksToBounds = true
    }

}
