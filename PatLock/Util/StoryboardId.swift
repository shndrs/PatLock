//
//  StoryboardId.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

public enum StoryboardId: String {
    
    case main = "Main"
    case patternSettings = "PatternSettings"
    
}

// MARK: - Methods

extension StoryboardId {
    
    public func raw() -> String {
        switch self {
        case .main:
            return StoryboardId.main.rawValue
        case .patternSettings:
            return StoryboardId.patternSettings.rawValue
        }
    }
    
}
