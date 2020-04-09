//
//  GamePlayViewController.swift
//  NumberGame
//
//  Created by David on 4/8/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var lhsNumsLabel: UILabel!
    @IBOutlet weak var rhsNumsLabel: UILabel!
    @IBOutlet weak var operationSignLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //properties
    var currentScore = 0
    var lhsNumOne = 0
    var lhsNumTwo = 0
    var rhsNumOne = 0
    var rhsNumTwo = 0
    var randomNumMin = 1
    var randomNumMax = 10
    
    var timeLeft: Float = 2.0
    let startingTimeGiven: Float = 2.0
    var progress: Float = 2.0
    var userAnswer = false
    let timeStep: Float = 0.1
    var lostGame = false
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    // ACTIONS
    
    @IBAction func trueButtonTapped(_ sender: Any) {
        userAnswer = true
        checkUserAnswer()
    }
    
    @IBAction func falseButtonTapped(_ sender: Any) {
        userAnswer = false
        checkUserAnswer()
    }
    
    //FUNCTIONS
    func checkUserAnswer(){
        if userAnswer == (lhsNumOne < rhsNumOne){
            print("\n Answer correct. timeleft: \(timeLeft)")
            currentScore += 1
            scoreLabel.text = "Score: \(currentScore)"
            startNewLevel()
        } else {
            print("Game over: wrong answer")
            lostGame = true
            print("Before score: \(currentScore)")
            GameController.scores.append(currentScore)
            print("game controller scores: \(GameController.scores)")
            
            performSegue(withIdentifier: "gameOver", sender: self)
        }
    }
    
    func startNewGame() {
        currentScore = 0
        startNewLevel()
        timerLoop()
    }
    
    @objc func timerLoop() {
        print("new loop. time left:\(timeLeft)")
        timeLeft -= timeStep
        progress = timeLeft / startingTimeGiven
        progressBar.setProgress(progress, animated: true)
        if timeLeft <= 0 {
            print("time ran out. time left \(timeLeft)")
            print("Before score: \(currentScore)")
            GameController.scores.append(currentScore)
            print("game controller scores: \(GameController.scores)")
            performSegue(withIdentifier: "gameOver", sender: self)
            print("post segue. about to return")
            return
        } else if lostGame == true {
            print("game lost from wrong answer selected. stopping timer now. Time left when timer stopped: \(timeLeft)")
            return
        }
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeStep), target: self, selector: #selector(timerLoop), userInfo: nil, repeats: false)
    }
    
    
    func startNewLevel() {
        print("New level started. time left before reset \(timeLeft)")
        lhsNumOne = Int(arc4random_uniform(UInt32(randomNumMax-randomNumMin+1))) + randomNumMin
        rhsNumOne = Int(arc4random_uniform(UInt32(randomNumMax-randomNumMin+1))) + randomNumMin
        
        lhsNumsLabel.text = "\(lhsNumOne)"
        rhsNumsLabel.text = "\(rhsNumOne)"
        
        timeLeft = startingTimeGiven
        progress = 2.0
        print("New level started. time left after reset \(timeLeft)")
        progressBar.setProgress(progress, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
