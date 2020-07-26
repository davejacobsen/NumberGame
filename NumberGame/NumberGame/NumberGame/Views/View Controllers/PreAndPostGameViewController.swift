//
//  PreAndPostGameViewController.swift
//  NumberGame
//
//  Created by David on 4/8/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class PreAndPostGameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //segues over to GamePlayVC
    @IBAction func startButtonTapped(_ sender: Any) {
    }
    
    //This is the segue triggered when time runs out or a wrong answer is selected
    @IBAction func gameOver(segue: UIStoryboardSegue) {
        print("View appearing. Current score array: \(GameController.scores)")
        if GameController.scores.first != nil {
            if GameController.scores.last == 1 {
                scoreLabel.text = "You scored 1 point :("
            } else {
                scoreLabel.text = "You scored \(GameController.scores.last!) points!"
            }
        }
    }
}
