//
//  ThirdViewController.swift
//  TyperTest
//
//  Created by Zach Buchanan on 11/14/19.
//  Copyright © 2019 Zach Buchanan. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {

    var scoreArray: [Score] = []
    
    @IBOutlet weak var highScores: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        scoreArray = []
        for score in TyperTestSingleton.sharedInstance.HighScores {
            scoreArray.append(score)
        }
        if scoreArray.count != 0{
            highScores.text = """
            Errors: \(scoreArray[0].errors) \n
            WPM: \(Int(scoreArray[0].wpm)) \n
            Test: \(scoreArray[0].testType)
            """
        }
        
    }


}
