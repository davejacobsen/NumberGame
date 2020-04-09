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
    var startingTimeGiven: Float = 2.0
    var progress: Float = 2.0
    var userAnswer = false
    var timeStep: Float = 0.02
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    // ACTIONS
  
    @IBAction func trueButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "gameOver", sender: self)
//        userAnswer = true
//        checkUserAnswer()
    }
    
    @IBAction func falseTapped(_ sender: Any) {
        userAnswer = false
        checkUserAnswer()
    }
    
    //FUNCTIONS
    func checkUserAnswer(){
        
    }
    
    func startNewGame() {
        startNewLevel()
    }
    
    func timerLoop() {
        timeLeft += timeStep
        progress = timeLeft / startingTimeGiven
    
    }
    
    func startNewLevel() {
        lhsNumOne = Int(arc4random_uniform(UInt32(randomNumMax-randomNumMin+1))) + randomNumMin
        rhsNumOne = Int(arc4random_uniform(UInt32(randomNumMax-randomNumMin+1))) + randomNumMin
        
        lhsNumsLabel.text = "\(lhsNumOne)"
        rhsNumsLabel.text = "\(rhsNumOne)"
        
        timeLeft = startingTimeGiven
        progress = 2.0
        
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
