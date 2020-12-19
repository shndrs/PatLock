//
//  PatternSettingsVC.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

final class PatternSettingsVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.cleanFooterView()
        }
    }
    
}

// MARK: - Life Cycle

extension PatternSettingsVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
