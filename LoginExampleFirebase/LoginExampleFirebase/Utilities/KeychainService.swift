//
//  KeychainService.swift
//  LoginExampleFirebase
//
//  Created by Wu Guanguan on 4/20/23.
//

import Foundation
import KeychainSwift

class KeychainService {
    var _keyChain = KeychainSwift()
    
    var keyChain : KeychainSwift{
        get {
            return _keyChain
        }
        set {
            _keyChain = newValue
        }  
    }
}
