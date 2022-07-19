//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                        
        progressBar.progress = 0.0
        
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
         
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector:  #selector(self.updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
        let answerChoices = quizBrain.getChoiceAnswer()
        
        trueButton.setTitle(answerChoices[0], for: .normal)
        falseButton.setTitle(answerChoices[1], for: .normal)
        choice3Button.setTitle(answerChoices[2], for: .normal)
        
        questionLabel.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }
    
}

