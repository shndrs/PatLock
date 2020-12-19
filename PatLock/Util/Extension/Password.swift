//
//  Password.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import Foundation

final class Password: NSObject {
    
    static let passwordKey = "password"
    
    static var lockSequence: [NSNumber]? {
        get {
            return UserDefaults.standard.array(forKey: passwordKey) as? [NSNumber]
        }
        set (lockSequence) {
            UserDefaults.standard.set(lockSequence, forKey: passwordKey)
        }
    }
    
}
