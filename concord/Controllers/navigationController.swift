//
//  navigationController.swift
//  concord
//
//  Created by Yago Marques on 22/06/22.
//

import UIKit

enum ColorCompatibility {
    static var myTintColor: UIColor {
        return UIViewController().isDarkMode ? Colors.primaryLightColor : Colors.primaryColor
    }
    static var joinButtonColor: UIColor {
        return UIViewController().isDarkMode ? Colors.primaryColor : Colors.secondaryColor
    }
}

class navigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTintColor()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setTintColor()
    }
    
    private func setTintColor() {
        self.navigationBar.tintColor = ColorCompatibility.myTintColor
    }

}

extension UIViewController {
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }

}
