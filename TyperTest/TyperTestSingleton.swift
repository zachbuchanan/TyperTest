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
    
    private init() {}
}
