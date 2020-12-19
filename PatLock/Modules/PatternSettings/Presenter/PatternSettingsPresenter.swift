//
//  PatternSettingsPresenter.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import Foundation

protocol PatternSettingsView: AnyObject {
    func setTableView(with array: [PatternSettings])
}

final class PatternSettingsPresenter: NSObject {
    
    private weak var view: PatternSettingsView?
    
    init(view: PatternSettingsView?) {
        self.view = view
    }
    
}

// MARK: - Methods

extension PatternSettingsPresenter {
    
    public func getItems() {
        let dwi = DispatchWorkItem { [weak self] in
            guard let items = self?.setItems() else { return }
            DispatchQueue.main.async {
                self?.view?.setTableView(with: items)
            }
        }
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
        
    fileprivate func setItems() -> [PatternSettings] {
        return [PatternSettings]()
    }
    
}
