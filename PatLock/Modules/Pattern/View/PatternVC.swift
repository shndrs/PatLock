//
//  PatternVC.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import UIKit
import CCGestureLock

fileprivate enum LockMode {
    case unlocked
    case locked
}

final class PatternVC: UIViewController {
    
    private var lockMode: LockMode {
        get {
            return Password.lockSequence == nil ? .unlocked : .locked
        }
    }
    
    @IBOutlet private weak var gestureLock: CCGestureLock!
    @IBOutlet private weak var controlView: UIView!
    @IBOutlet private weak var btnCancel: UIButton!
    @IBOutlet private weak var btnConfirm: UIButton!

}

// MARK: - Methods

fileprivate extension PatternVC {
    
    @objc func gestureComplete(gestureLock: CCGestureLock) {
        if lockMode == .locked {
            if Password.lockSequence! == gestureLock.lockSequence {
                Password.lockSequence = nil
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                    self.dismiss(animated: true, completion: nil)
                })
            } else {
                gestureLock.gestureLockState = .error
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                    gestureLock.gestureLockState = .normal
                })
            }
        } else {
            enableButtons(true)
        }
    }
    
    func enableButtons(_ enable: Bool) {
        [btnCancel, btnConfirm].forEach { (button) in
            button?.isEnabled = enable
            button?.alpha = enable ? 1 : 0.5
        }
    }
    
    func setupButtons() {
        [btnCancel, btnConfirm].forEach { (button) in
            button?.layer.cornerRadius = 5
            button?.layer.borderColor = UIColor.white.cgColor
            button?.layer.borderWidth = 2
            button?.addTarget(
                self,
                action: #selector(buttonTapped),
                for: .touchUpInside
            )
        }
    }
    
    func setupControlPanel() {
        controlView.isHidden = lockMode == .locked
        if !controlView.isHidden {
            setupButtons()
            enableButtons(false)
        }
    }
    
    @objc func buttonTapped(button: UIButton) {
        if button == btnConfirm {
            Password.lockSequence = gestureLock.lockSequence
            dismiss(animated: true, completion: nil)
        } else {
            gestureLock.gestureLockState = .normal
            enableButtons(false)
        }
    }
    
}

// MARK: - Life Cycle

extension PatternVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GestureLockSetup(view: gestureLock) { [weak self] in
            guard let self = self else { return }
            self.gestureComplete(gestureLock: self.gestureLock)
        }.setup()
        setupControlPanel()
    }
    
}
