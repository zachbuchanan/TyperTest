//
//  ThirdViewController.swift
//  TyperTest
//
//  Created by Zach Buchanan on 11/14/19.
//  Copyright © 2019 Zach Buchanan. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var scoreArray: [Score] = []
    
    @IBOutlet weak var highScores: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scoreArray = []
        for score in TyperTestSingleton.sharedInstance.HighScores {
            scoreArray.append(score)
        }

        self.tableView.reloadData()
        
    }
}

extension ScoresViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreArray.count
    }
    	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRow:", indexPath.row)
        print("scorearraycount: ", scoreArray.count)
        let cell = tableView.dequeueReusableCell(withIdentifier: "scorecell", for: indexPath)
        
        if indexPath.row < scoreArray.count {
            cell.textLabel?.text = "\(scoreArray[indexPath.row].testType)"
            cell.detailTextLabel?.text = "WPM: \(scoreArray[indexPath.row].wpm) Errors: \(scoreArray[indexPath.row].errors)"
        } else {
            cell.textLabel?.text = "No Value"
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("row:", indexPath.row)
        //print("section:", indexPath.section)
    }
    
}
