//
//  UITableView.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit

extension UITableView {
    
    public func asyncReload() {
        DispatchQueue.main.async { [weak self] in
            guard self != nil else { return }
            self?.reloadData()
        }
    }
    
    public func cleanFooterView() {
        DispatchQueue.main.async { [weak self] in
            guard self != nil else { return }
            self?.tableFooterView?.backgroundColor = .clear
            self?.tableFooterView = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: self?.frame.size.width ?? 0,
                                                         height: 1))
        }
    }
    
    public func asyncReload(in section: Int, rowAnimation: UITableView.RowAnimation = .fade) {
        DispatchQueue.main.async { [weak self] in
            guard self != nil else { return }
            self?.beginUpdates()
            self?.reloadSections(IndexSet(integer: section), with: rowAnimation)
            self?.endUpdates()
        }
    }
    
}
