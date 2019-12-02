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
    
    
    public var typerObject: TyperObject?
    public var userEnteredWords: [String] = []
    
    var textArrayIdx: Int = 0
    var typingErrors: Int = 0
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        beginTest()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        typerObject = TyperTestSingleton.sharedInstance.typerObject
        beginTest()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        textArrayIdx = 0
        typingErrors = 0
    }
}
//MARK: Functions
extension TypingTestViewController {
    func beginTest(){
        guard let typerObject = typerObject else {
            print("Could not get typerObject in beginTest")
            return
        }
        fullSentenceDisplay.text = typerObject.initializerText
        displayTextToType(Idx: textArrayIdx)
        inputField.addTarget(self, action: #selector(TypingTestViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    func displayTextToType(Idx: Int){
        guard let typerObject = typerObject else {
            print("Could not get typerObject in displayTextToType")
            return
        }
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
        guard let typerObject = typerObject else {
            print("Could not get typerObject in saveAndClearInput")
            return
        }
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
        guard let typerObject = typerObject else {
            print("Could not get typerObject in endTest")
            return
        }
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



