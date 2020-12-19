//
//  PatternSettingsTVC.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

final class PatternSettingsTVC: UITableViewCell, ReusableView {

    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
}

// MARK: - Methods

extension PatternSettingsTVC {
    
    public func fill(cell by: String) {
        titleLabel.text = by
    }
    
}
