//
//  RxAlertView.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/09.
//  Copyright © 2018 MuShare. All rights reserved.
//

import UIKit

public struct RxAlertViewConfig {
    
    var tip: String
    var confirm: String
    var warning: String
    var error: String
    var yes: String
    var no: String
    var ok: String
    var tintColor: UIColor?
    
    init(tip: String? = nil, confirm: String? = nil, warning: String? = nil, error: String? = nil,
        yes: String? = nil, no: String? = nil, ok: String? = nil, tintColor: UIColor? = nil) {
        self.tip = tip ?? "Tip"
        self.confirm = confirm ?? "Confirm"
        self.warning = warning ?? "Warning"
        self.error = error ?? "Error"
        self.yes = yes ?? "Yes"
        self.no = no ?? "No"
        self.ok = ok ?? "OK"
        self.tintColor = tintColor
    }
}

public enum RxAlertViewType {
    case tip(message: String)
    case warning(message: String)
    case error(message: String)
    case confirm(title: String, message: String, onConfirm: (() -> ())? )
    
}

public class RxAlertViewCreator {
    
    public static let instance = RxAlertViewCreator()
    
    public var config = RxAlertViewConfig()
    
    private init() {}
    
    public func create(type: RxAlertViewType, completion: (() -> ())? = nil) -> UIAlertController {
        switch type {
        case .tip(let message):
            return createAlert(title: config.tip, message: message)
        case .warning(let message):
            return createAlert(title: config.tip, message: message)
        case .error(let message):
            return createAlert(title: config.tip, message: message)
        case .confirm(let title, let message, let onConfirm):
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: config.yes, style: .default) { action in
                onConfirm?()
            })
            alertController.addAction(UIAlertAction(title: config.no, style: .cancel))
            return alertController
        }
    }
    
    private func createAlert(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: config.ok, style: .cancel))
        return alertController
    }

}
