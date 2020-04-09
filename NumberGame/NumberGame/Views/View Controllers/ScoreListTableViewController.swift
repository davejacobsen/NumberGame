//
//  ScoreListTableViewController.swift
//  NumberGame
//
//  Created by Chris Gottfredson on 4/8/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class ScoreListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GameController.loadFromPersistentStore()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return GameController.scores.count
        default:
            return 1
        }
    }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            let highScoreCell = tableView.dequeueReusableCell(withIdentifier: "highScoreCell", for: indexPath)
            guard let highScore = GameController.scores.max() else { return UITableViewCell() }
            print(highScore)
            let scoreIndex = GameController.scores.firstIndex(of: highScore)
            highScoreCell.textLabel?.text = "Game \(scoreIndex! + 1)"
            highScoreCell.detailTextLabel?.text = "Score: \(String(describing: highScore))"

            return highScoreCell
            
        default:
            let scoreCell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)
            let score = GameController.scores[indexPath.row]
            scoreCell.textLabel?.text = "Game \(indexPath.row + 1)"
            scoreCell.detailTextLabel?.text = "Score: \(score)"

            return scoreCell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "High Score"
        default:
            return "Scoreboard"
        }
    }
    
    
}
