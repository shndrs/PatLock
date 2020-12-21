//
//  TableBasedViewController.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

class TableBasedViewController: UIViewController {
    
    var largeTitle: Bool = false {
        willSet(newVal) {
            if #available(iOS 11.0, *) {
                navigationController?.navigationBar.prefersLargeTitles = newVal
            }
        }
    }
    
    @IBOutlet internal weak var tableView: UITableView! {
        didSet {
            tableSetup()
        }
    }
    
}

// MARK: - Methods

extension TableBasedViewController {
    
    @objc func tableSetup() {
        tableView.cleanFooterView()
    }
    
    func register(reuseIds: Array<String>) {
        for id in reuseIds {
            Register.in(component: tableView, id: id)
        }
    }
    
}

// MARK: - Life Cycle

extension TableBasedViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
