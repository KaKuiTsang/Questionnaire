//
//  ViewController.swift
//  questionnaire
//
//  Created by Tsang Ka Kui on 5/8/2016.
//  Copyright © 2016年 Tsang Ka Kui. All rights reserved.
//

import UIKit

struct Question {
    var questionString: String?
    var answers: [String]?
    var selectedAnswer: Int?
}

var q1 = Question(questionString: "What is your favorite NBA Star?", answers: ["Kobe Bryant", "Leborn James", "Stephen Curry"], selectedAnswer: nil)
var q2 = Question(questionString: "What is your favorite Pokemon", answers: ["Bulbasaur", "Squirtle", "Charmander", "Mewtwo", "Dragonite"], selectedAnswer: nil)
var q3 = Question(questionString: "What is your favorite Sports", answers: ["Basketball", "Soccer", "Tennis", "Badminton", "Marathon"], selectedAnswer: nil)
var  questions = [q1, q2, q3]

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let questionNumber = navigationController?.viewControllers.indexOf(self)
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.title = "Question \(questionNumber! + 1) / \(questions.count)"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        tableView.registerClass(AnswerCell.self, forCellReuseIdentifier: "answer")
        tableView.registerClass(HeaderCell.self, forHeaderFooterViewReuseIdentifier: "question")
        tableView.sectionHeaderHeight = 50
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let questionNumber = navigationController?.viewControllers.indexOf(self) {
            return questions[questionNumber].answers!.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("answer") as! AnswerCell
        
        if let questionNumber = navigationController?.viewControllers.indexOf(self) {
            let question = questions[questionNumber]
            cell.label.text = question.answers![indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("question") as! HeaderCell
        
        if let questionNumber = navigationController?.viewControllers.indexOf(self) {
            let question = questions[questionNumber]
            header.label.text = question.questionString!
        }
        
        return header
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let index = navigationController?.viewControllers.indexOf(self) {
            questions[index].selectedAnswer = indexPath.row
            
            if index < questions.count - 1  {
                let controller = ViewController()
                navigationController?.pushViewController(controller, animated: true)
            } else {
                let controller = ResultViewController()
                navigationController?.pushViewController(controller, animated: true)
            }
        }

    }
}

