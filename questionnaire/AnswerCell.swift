//
//  AnswerCell.swift
//  questionnaire
//
//  Created by Tsang Ka Kui on 5/8/2016.
//  Copyright © 2016年 Tsang Ka Kui. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {

     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = UIFont.systemFontOfSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupConstraints() {
        addSubview(label)
        label.topAnchor.constraintEqualToAnchor(topAnchor, constant: 8).active = true
        label.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -8).active = true
        label.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: 16).active = true
        label.trailingAnchor.constraintEqualToAnchor(trailingAnchor, constant: -8).active = true
    }
    
}
