//
//  TyperObject.swift
//  TyperTest
//
//  Created by Zach Buchanan on 12/2/19.
//  Copyright © 2019 Zach Buchanan. All rights reserved.
//

import Foundation

//MARK: Typer Object
//To Do: This object should set its initializer text based on selection on configuration.
//Use get and set to do this. This will make the OOP easier and will allow us to ignore downcasting
class TyperObject {
    public var testType: TestType?
    public var initializerText: String = ""
    public var textArray: [String] = []

    init() {
        self.setTestType(type: .Ox) // Initialize as Ox as a default
    }

    public func setTestType(type: TestType) {
        testType = type
        initializerText = type.text()
        textArray = initializerText.components(separatedBy: " ")
    }
    
    //zach added
    public func returnTestType() -> String {
        switch testType {
        case .Ox:
            return "Ox and Frog"
        case .Fox:
            return "Fox and Grapes"
        case .Gnat:
            return "Gnat and Bull"
        default:
            return "Ox and Frog"
        }
    }
    
    enum TestType {
        case Ox
        case Fox
        case Gnat

        func text() -> String {
            switch self {
            case .Ox:
                return "An Ox came down to a reedy pool to drink. As he splashed heavily into the water, he crushed a young Frog into the mud."
            case .Fox:
                return "A Fox one day spied a beautiful bunch of ripe grapes hanging from a vine trained along the branches of a tree."
            case .Gnat:
                return "A Gnat flew over the meadow with much buzzing for so small a creature and settled on the tip of one of the horns of a Bull."
            }
            
        }
    }
}
