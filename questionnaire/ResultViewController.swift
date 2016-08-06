//
//  ResultViewController.swift
//  questionnaire
//
//  Created by Tsang Ka Kui on 6/8/2016.
//  Copyright © 2016年 Tsang Ka Kui. All rights reserved.
//

import UIKit

let personalities = ["A", "B", "C", "D", "E", "F"]


class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Result"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(didPressDoneButton))
        view.backgroundColor = UIColor.whiteColor()
        setupConstraints()
        let result = fetchResult()
        resultLabel.text = "Your personality type: \(result)"
    }
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.textAlignment = .Center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupConstraints() {
        view.addSubview(resultLabel)
        resultLabel.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 8).active = true
        resultLabel.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -8).active = true
        resultLabel.heightAnchor.constraintEqualToConstant(200).active = true
        resultLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        resultLabel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
    }
    
    func fetchResult() -> String {
        var score = 0
        for question in questions {
            score += question.selectedAnswer!
        }
        let index = score % personalities.count
        let result = personalities[index]
        return result
    }
    
    func didPressDoneButton() {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
