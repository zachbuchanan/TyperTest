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
        if foxGrapes.isOn {
            foxGrapes.setOn(false, animated: true)
        }
        if gnatBull.isOn {
            gnatBull.setOn(false, animated: true)
        }
    }
    @IBAction func foxGrapesSwitch(_ sender: Any) {
        if frogsOx.isOn {
            frogsOx.setOn(false, animated: true)
        }
        if gnatBull.isOn {
            gnatBull.setOn(false, animated: true)
        }
    }
    @IBAction func gnatBullSwitch(_ sender: Any) {
        if foxGrapes.isOn {
            foxGrapes.setOn(false, animated: true)
        }
        if frogsOx.isOn {
            frogsOx.setOn(false, animated: true)
        }
    }
    
    func createTyperObject() -> TyperObject {
        if frogsOx.isOn {
            return TyperObject(initString: initTextArray[0])
        } else if foxGrapes.isOn {
            return TyperObject(initString: initTextArray[1])
        } else if gnatBull.isOn {
            return TyperObject(initString: initTextArray[2])
        } else {
            return TyperObject(initString: initTextArray[0])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        initializingTyperObject = createTyperObject()
    }

    var initializingTyperObject: TyperObject
    func getConfigInitializer() -> TyperObject{
        return initializingTyperObject
    }
    
    //0->ox 1->fox 2->gnat
    var initTextArray: [String] = ["An Ox came down to a reedy pool to drink. As he splashed heavily into the water, he crushed a young Frog into the mud.The old Frog soon missed the little one and asked his brothers and sisters what had become of him.","A Fox one day spied a beautiful bunch of ripe grapes hanging from a vine trained along the branches of a tree. The grapes seemed ready to burst with juice, and the Fox's mouth watered as he gazed longingly at them.","A Gnat flew over the meadow with much buzzing for so small a creature and settled on the tip of one of the horns of a Bull."]
    

}

//MARK: Typer Object
//To Do: This object should set its initializer text based on selection on configuration.
//Use get and set to do this. This will make the OOP easier and will allow us to ignore downcasting
class TyperObject {
    public var initializerText: String
    public var textArray: [String] = []
    init(initString: String) {
        initializerText = initString
        textArray = initializerText.components(separatedBy: " ")
    }
    
}
//A Gnat flew over the meadow with much buzzing for so small a creature and settled on the tip of one of the horns of a Bull.

