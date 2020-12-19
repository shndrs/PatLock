//
//  BioAuthenticationHandler.swift
//  PatLock
//
//  Created by Sahand Raeisi on 12/19/20.
//

import Foundation
import LocalAuthentication

public protocol BioAuthenticationDelegate: AnyObject {
    func success()
    func error(value: Error)
}

public enum BiometricType {
    case none
    case touch
    case face
}

final public class BioAuthenticationHandler: NSObject {
    
    private weak var delegate: BioAuthenticationDelegate?
    
    public init(delegate: BioAuthenticationDelegate?) {
        self.delegate = delegate
    }
    
}

// MARK: - Methods

extension BioAuthenticationHandler {
    
    public func set() {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = Strings.usePasscode.rawValue
        var authorizationError: NSError?
        let reason = Strings.secureDataAuthentication.rawValue
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication,
                                                        error: &authorizationError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication,
                                                      localizedReason: reason) {
                [weak self] success, evaluateError in
                guard self != nil else { return }
                if success {
                    DispatchQueue.main.async {
                        self?.delegate?.success()
                    }
                } else {
                    guard let error = evaluateError else { return }
                    self?.delegate?.error(value: error)
                }
            }
        } else {
            guard let error = authorizationError else { return }
            self.delegate?.error(value: error)
        }
    }
    
    public func biometricType() -> BiometricType {
        let authContext = LAContext()
        if #available(iOS 11, *) {
            let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch authContext.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touch
            case .faceID:
                return .face
            default:
                return .none
            }
        } else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touch : .none
        }
    }
    
}

