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
    
    
    //properties
    var currentScore = 0
    var lhsNum = 0
    var randomNumMin = 1
    var randomNumMax = 10
    
    var timeLeft: Float = 2.0
    var startingTimeGiven: Float = 2.0
    var progress: Float = 2.0
    var userAnswer = false
    var timeStep: Float = 0.02
    
    func GamePlayViewController(){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ACTIONS
    //falseButtonTapped
    //trueButtonTapped
    
    
    //FUNCTIONS
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
