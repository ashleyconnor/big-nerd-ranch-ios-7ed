//
//  ViewController.swift
//  Quiz
//
//  Created by Ashley Connor on 29/04/2020.
//  Copyright © 2020 Rublix. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 8+8?",
        "What is the capital of Texas?",
        "What is wine made from?"
    ]
    
    let answers: [String] = [
        "16",
        "Austin",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}

