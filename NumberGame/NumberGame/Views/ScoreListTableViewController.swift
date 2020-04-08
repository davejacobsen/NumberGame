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
    
    // MARK: - Table view data source

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameController.scores.count
    }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)
        let score = GameController.scores[indexPath.row]
        cell.textLabel?.text = "Game \(indexPath.row + 1)"
        cell.detailTextLabel?.text = "\(score)"

        return cell
    }
}
