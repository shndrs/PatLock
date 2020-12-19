//
//  PatternSettingsVC.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

final class PatternSettingsVC: TableBasedViewController {
    
    private lazy var presenter: PatternSettingsPresenter = {
        return PatternSettingsPresenter(view: self)
    }()
    
    private lazy var items: [PatternSettings] = {
        return [PatternSettings]()
    }()
    
}

// MARK: - Methods

extension PatternSettingsVC {
    
    override func tableSetup() {
        super.tableSetup()
        tableView.delegate = self
        tableView.dataSource = self
        register(reuseIds: [PatternSettingsTVC.reuseIdentifier])
    }
    
}

// MARK: - Life Cycle

extension PatternSettingsVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getItems()
    }
    
}

// MARK: - View Implementation

extension PatternSettingsVC: PatternSettingsView {
    
    func goToSet() {
        
    }
    
    func goToReset() {
        
    }
    
    func setTableView(with array: [PatternSettings]) {
        items = array
        tableView.asyncReload()
    }
    
}

// MARK: - TableView Implementation

extension PatternSettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: PatternSettingsTVC.reuseIdentifier) as? PatternSettingsTVC
        cell?.fill(cell: items[indexPath.row].title)
        return cell ?? UITableViewCell()
    }
    
}
