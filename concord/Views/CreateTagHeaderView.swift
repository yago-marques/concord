//
//  CeateTagHeaderView.swift
//  concord
//
//  Created by Yago Marques on 23/06/22.
//

import UIKit

protocol CreateTagHeaderViewDelegate {
    func presentModal()
}

class CreateTagHeaderView: UIView {

    let label = UILabel()
    let button = UIButton()

    var delegate: CreateTagHeaderViewDelegate
    
    init(delegate: CreateTagHeaderViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showModal() {
        delegate.presentModal()
    }
    
    func start() {
        label.text = "Tags"
        button.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        button.setTitle("Add tag", for: .normal)
        button.setTitleColor(ColorCompatibility.myTintColor, for: .normal)
                
        self.addSubview(label)
        self.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            button.centerYAnchor.constraint(equalTo: label.centerYAnchor)
        ])
    }
    
    

}
