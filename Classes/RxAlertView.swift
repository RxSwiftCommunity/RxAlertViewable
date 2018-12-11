//
//  RxAlertView.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/09.
//  Copyright © 2018 MuShare. All rights reserved.
//

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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

public enum RxAlertType {
    case tip(message: String)
    case customTip(title: String, message: String)
    case warning(message: String)
    case error(message: String)
    case confirm(title: String, message: String, onConfirm: (() -> ())?)
}

public class RxAlertViewCreator {
    
    public static let instance = RxAlertViewCreator()
    
    public var config = RxAlertViewConfig()
    
    private init() {}
    
    public func create(type: RxAlertType, completion: (() -> ())? = nil) -> UIAlertController {
        switch type {
        case .tip(let message):
            return createAlert(title: config.tip, message: message)
        case .customTip(let title, let message):
            return createAlert(title: title, message: message)
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
