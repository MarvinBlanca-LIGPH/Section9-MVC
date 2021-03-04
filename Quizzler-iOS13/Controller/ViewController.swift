//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userAnswerCorrect = quizBrain.checkAnswer(userAnswer)
        
        if userAnswerCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self,selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getNextQuestion()
        oneButton.setTitle(quizBrain.getChoices(0), for: .normal)
        twoButton.setTitle(quizBrain.getChoices(1), for: .normal)
        threeButton.setTitle(quizBrain.getChoices(2), for: .normal)
        progressBar.progress = quizBrain.getQuizProgress()
        scoreLabel.text = "Score: \(quizBrain.score)"
        
        oneButton.backgroundColor = UIColor.clear
        twoButton.backgroundColor = UIColor.clear
        threeButton.backgroundColor = UIColor.clear
    }
    
}

