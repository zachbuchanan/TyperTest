//
//  ThirdViewController.swift
//  TyperTest
//
//  Created by Zach Buchanan on 11/14/19.
//  Copyright © 2019 Zach Buchanan. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {
    
    var gameVC: TypingTestViewController?
    
    @IBOutlet weak var highScores: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // display the top five high scores
    override func viewWillAppear(_ animated: Bool) {
        highScores.text = String(format:"%i \n%i \n%i", (gameVC?.highScores[0])!, (gameVC?.highScores[1])!, (gameVC?.highScores[2])!,
            (gameVC?.highScores[3])!,
            (gameVC?.highScores[4])!)
    }

}
