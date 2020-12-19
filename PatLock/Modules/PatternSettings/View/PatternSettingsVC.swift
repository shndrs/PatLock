//
//  PatternSettingsVC.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

final class PatternSettingsVC: TableBasedViewController {
    
    
    
}

// MARK: - Methods

extension PatternSettingsVC {
    
    fileprivate func searchSetup() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    override func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
//        register(reuseIds: RIDs.categoryVC)
    }
    
}

// MARK: - Life Cycle

extension PatternSettingsVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - TableView Implementation

extension PatternSettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
