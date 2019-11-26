//
//  SecondViewController.swift
//  TyperTest
//
//  Created by Zach Buchanan on 11/14/19.
//  Copyright © 2019 Zach Buchanan. All rights reserved.
//

import UIKit

class TypingTestViewController: UIViewController {

    
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordToType: UILabel!
    @IBOutlet weak var fullSentenceDisplay: UITextView!
    @IBOutlet weak var errorLabelDisplay: UILabel!
    
    public var typerObject = TyperObject()
    public var userEnteredWords: [String] = []
    
    var textArrayIdx: Int = 0
    var typingErrors: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        beginTest()
    }
    
    
    
}
//MARK: Functions
extension TypingTestViewController {
    func beginTest(){
        fullSentenceDisplay.text = typerObject.initializerText
        displayTextToType(Idx: textArrayIdx)
        inputField.addTarget(self, action: #selector(TypingTestViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    func displayTextToType(Idx: Int){
        wordToType.text = typerObject.textArray[Idx]
    }
   
    @objc func textFieldDidChange(_ textField: UITextField) {
        let currentText = textField.text
        if let text = currentText {
            if text.last == " " {
                saveAndClearInput(input: text)
            }
        }
    }
    
    func saveAndClearInput(input text: String){
        let trimmedString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        userEnteredWords.append(trimmedString)
        inputField.text = ""
        textArrayIdx += 1
        if textArrayIdx < typerObject.textArray.count{
            displayTextToType(Idx: textArrayIdx)
        } else {
            endTest()
        }
        
    }
    
    func endTest(){
        for (testWord, inputWord) in zip(typerObject.textArray, userEnteredWords) {
            if testWord != inputWord {
                typingErrors += 1
            }
        }
        inputField.removeTarget(self, action: #selector(TypingTestViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        inputField.endEditing(true)
        errorLabelDisplay.text = String(typingErrors)
    }
}

//MARK: Typer Object
//To Do: This object should set its initializer text based on selection on configuration.
//Use get and set to do this. This will make the OOP easier and will allow us to ignore downcasting
class TyperObject {
    public var initializerText: String {
        get {
            //return "A Gnat flew over the meadow with much buzzing for so small a creature and settled on the tip of one of the horns of a Bull."
            return "This is a test"
        }
    }
    
    public var textArray: [String] = []
    init() {
        textArray = initializerText.components(separatedBy: " ")
    }
    
}

