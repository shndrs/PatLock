//
//  GestureLockSetup.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import CCGestureLock

final class GestureLockSetup: NSObject {
    
    private var view: CCGestureLock!
    @objc private var cb: (() -> ())!
    
    init(view: CCGestureLock!, cb: @escaping () -> ()) {
        self.view = view
        self.cb = cb
    }
    
}

// MARK: - Methods

extension GestureLockSetup {
    
    func setup() {
        view.lockSize = (3, 3)
        view.edgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        view.setSensorAppearance(
            type: .inner,
            radius: 5,
            width: 1,
            color: .white,
            forState: .normal
        )
        view.setSensorAppearance(
            type: .outer,
            color: .clear,
            forState: .normal
        )
        view.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: .white,
            forState: .selected
        )
        view.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: .green,
            forState: .selected
        )
        view.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: .red,
            forState: .error
        )
        view.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: .red,
            forState: .error
        )
        [CCGestureLock.GestureLockState.normal, CCGestureLock.GestureLockState.selected]
            .forEach { (state) in
            view.setLineAppearance(
                width: 5.5,
                color: UIColor.white.withAlphaComponent(0.5),
                forState: state
            )
        }
        view.setLineAppearance(
            width: 5.5,
            color: UIColor.red.withAlphaComponent(0.5),
            forState: .error
        )
        view.addTarget(
            self,
            action: #selector(getter: self.cb),
            for: .gestureComplete
        )
    }
    
}
