//
//  TyperTestSingleton.swift
//  TyperTest
//
//  Created by Zach Buchanan on 12/2/19.
//  Copyright © 2019 Zach Buchanan. All rights reserved.
//

import Foundation

final class TyperTestSingleton {
    static let sharedInstance = TyperTestSingleton()
    
    var typerObject: TyperObject = TyperObject()
    
    public var HighScores: [Score] = []
    
    public func addScore(errors: Int, wpm: Double, typerobject: TyperObject){
        HighScores.append(Score(Errors: errors, WPM: wpm, TyperObject: typerobject))
    }
    
    private init() {}
}


//scoring object
class Score {
    var errors: Int
    var wpm: Double
    var testType: String
    
    init(Errors _errors: Int, WPM _wpm: Double, TyperObject _typerobject: TyperObject) {
        errors = _errors
        wpm = _wpm
        testType = _typerobject.returnTestType()
    }
    

}
