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
    @IBOutlet weak var WPMLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    public var typerObject: TyperObject?
    public var userEnteredWords: [String] = []
    
    var textArrayIdx: Int = 0
    var typingErrors: Int = 0
    
    //timer variables
    var timer = Timer()
    var counter: Int = 0
    var hasTimerStarted: Bool = false;
    
    
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
        clearTimer()
        textArrayIdx = 0
        typingErrors = 0
        errorLabelDisplay.text = ""
        WPMLabel.text = ""
        timerLabel.text = "0"
        hasTimerStarted = false
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
        if !hasTimerStarted {
            startTimer()
        }
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
        stopTimer()
        for (testWord, inputWord) in zip(typerObject.textArray, userEnteredWords) {
            if testWord != inputWord {
                typingErrors += 1
            }
        }
        inputField.removeTarget(self, action: #selector(TypingTestViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        inputField.endEditing(true)
        errorLabelDisplay.text = String(typingErrors)
        let wpm = calculateWordsPerMinute(Errors: typingErrors, TimeInSeconds: counter, NumberOfWordsTyped: typerObject.textArray.count)
        WPMLabel.text = String(wpm)
        //add score to singleton
        TyperTestSingleton.sharedInstance.addScore(errors: typingErrors, wpm: wpm, typerobject: typerObject)
    }
    
    func startTimer(){
        if !hasTimerStarted {
            hasTimerStarted = true
        }
        timerLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    func stopTimer(){
        timer.invalidate()
    }
    func clearTimer(){
        timer.invalidate()
        counter = 0
    }
    @objc func updateCounter(){
        counter += 1
        timerLabel.text = String(counter)
    }
    func calculateWordsPerMinute(Errors errors: Int, TimeInSeconds time: Int, NumberOfWordsTyped numberOfWords: Int) -> Double{
        let wpm = Double(numberOfWords - errors) / (Double(time) / 60)
        return wpm
    }
}



