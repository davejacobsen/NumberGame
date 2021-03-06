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
    var randomNumMax = 9
    
    var timeLeft: Float = 6.0
    let startingTimeGiven: Float = 6.0
    var progress: Float = 1.0
    var userAnswer = false
    let timeStep: Float = 0.02
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
        if userAnswer == ((lhsNumOne + lhsNumTwo) < (rhsNumOne + rhsNumTwo)){
            print("\n Answer correct. timeleft: \(timeLeft)")
            currentScore += 1
            scoreLabel.text = "Score: \(currentScore)"
            startNewLevel()
        } else {
            print("Game over: wrong answer")
            lostGame = true
            print("Before score: \(currentScore)")
            GameController.scores.append(currentScore)
            GameController.saveToPersistentStore()
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
    //    print("new loop. time left:\(timeLeft)")
        print("progress before loop reset: \(progress)")
        progress = timeLeft / startingTimeGiven
        print("progress after loop reset: \(progress)")
        progressBar.setProgress(progress, animated: true)
        timeLeft -= timeStep
        if timeLeft <= 0 {
            print("time ran out. time left \(timeLeft)")
            print("Before score: \(currentScore)")
            GameController.scores.append(currentScore)
            GameController.saveToPersistentStore()
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
        lhsNumTwo = Int(arc4random_uniform(UInt32(randomNumMax-randomNumMin+1))) + randomNumMin
        rhsNumOne = Int(arc4random_uniform(UInt32(randomNumMax-randomNumMin+1))) + randomNumMin
        rhsNumTwo = Int(arc4random_uniform(UInt32(randomNumMax-randomNumMin+1))) + randomNumMin
        
        lhsNumsLabel.text = "\(lhsNumOne) + \(lhsNumTwo)"
        rhsNumsLabel.text = "\(rhsNumOne) + \(rhsNumTwo)"
        
        timeLeft = startingTimeGiven
        print("\nprogress before new level reset: \(progress)")
        progress = 1.0
        print("New level started. time left after reset \(timeLeft)")
        progressBar.setProgress(progress, animated: true)
        print("\nprogress after new level reset and progress bar set: \(progress)")
    }
}
