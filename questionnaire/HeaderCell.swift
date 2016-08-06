//
//  HeaderCell.swift
//  questionnaire
//
//  Created by Tsang Ka Kui on 5/8/2016.
//  Copyright © 2016年 Tsang Ka Kui. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "What is your favorite NBA star?"
        label.font = UIFont.boldSystemFontOfSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupConstraints() {
        addSubview(label)
        let labelTop = label.topAnchor.constraintEqualToAnchor(topAnchor, constant: 8)
        let labelBottom = label.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -8)
        let labelLeading = label.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: 16)
        let labelTrailing = label.trailingAnchor.constraintEqualToAnchor(trailingAnchor, constant: 8)
        NSLayoutConstraint.activateConstraints([ labelTop, labelBottom, labelLeading, labelTrailing ])
    }
    
}
