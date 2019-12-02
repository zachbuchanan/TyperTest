//
//  FirstViewController.swift
//  TyperTest
//
//  Created by Zach Buchanan on 11/14/19.
//  Copyright © 2019 Zach Buchanan. All rights reserved.
//

import UIKit

class ConfigureViewController: UIViewController {

    @IBOutlet weak var frogsOx: UISwitch!
    @IBOutlet weak var foxGrapes: UISwitch!
    @IBOutlet weak var gnatBull: UISwitch!
    
    @IBAction func frogsOxSwitch(_ sender: Any) {
        TyperTestSingleton.sharedInstance.typerObject.setTestType(type: .Ox)
        if foxGrapes.isOn {
            foxGrapes.setOn(false, animated: true)
        }
        if gnatBull.isOn {
            gnatBull.setOn(false, animated: true)
        }
    }
    @IBAction func foxGrapesSwitch(_ sender: Any) {
        TyperTestSingleton.sharedInstance.typerObject.setTestType(type: .Fox)
        if frogsOx.isOn {
            frogsOx.setOn(false, animated: true)
        }
        if gnatBull.isOn {
            gnatBull.setOn(false, animated: true)
        }
    }
    @IBAction func gnatBullSwitch(_ sender: Any) {
        TyperTestSingleton.sharedInstance.typerObject.setTestType(type: .Gnat)
        if foxGrapes.isOn {
            foxGrapes.setOn(false, animated: true)
        }
        if frogsOx.isOn {
            frogsOx.setOn(false, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
