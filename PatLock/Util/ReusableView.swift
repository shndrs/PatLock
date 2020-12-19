//
//  ReusableView.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
