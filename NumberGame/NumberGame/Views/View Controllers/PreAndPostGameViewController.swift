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
    

    
    @IBAction func startButtonTapped(_ sender: Any) {
    }
    
    
    //This is the segue triggered when time runs out or a wrong answer is selected
    @IBAction func gameOver(segue: UIStoryboardSegue) {
        
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
