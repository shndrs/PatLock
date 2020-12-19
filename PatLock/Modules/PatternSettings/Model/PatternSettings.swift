//
//  PatternSettings.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

final class PatternSettings: NSObject {
    
    var icon: UIImage!
    var title: String!
    var action: Action!
    
    public init(icon: UIImage, title: String, action: @escaping Action) {
        self.icon = icon
        self.title = title
        self.action = action
    }
    
}
