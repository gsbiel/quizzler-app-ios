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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var score: UILabel!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if(!isTimerRunning){
                let userAnswer = sender.currentTitle!
            
                let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
                
                if isAnswerCorrect {
                    sender.backgroundColor = UIColor.green
                    quizBrain.setScore(true)
                }else {
                    sender.backgroundColor = UIColor.red
                }
                
                quizBrain.nextQuestion()
                
                runTimer()
        }
        
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        score.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
     }
    
    @objc func updateTimer(){
        isTimerRunning = false
        timer.invalidate()
        updateUI()
    }
    
}

