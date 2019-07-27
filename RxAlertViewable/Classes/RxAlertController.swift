//
//  RxAlert.swift
//  RxAlertViewable
//
//  Created by takuji.terada on 2019/07/10.
//  Copyright © 2019 XFLAG. All rights reserved.
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

public protocol RxAlertItem {
    static var controllerType: RxAlertController.Type { get }
}

public protocol RxAlertController: UIViewController {

    static func create(title: String?, message: String?) -> Self

    func setAction(for category: RxAlertCategory, item: RxAlertItem?)
}

public struct UIAlertItem: RxAlertItem {
    
    public static let controllerType: RxAlertController.Type = UIAlertController.self
    
    var confirmTitle: String
    var denyTitle: String?
    
    public init(confirmTitle: String, denyTitle: String? = nil) {
        self.confirmTitle = confirmTitle
        self.denyTitle = denyTitle
    }
    
}

extension UIAlertController: RxAlertController {

    public static func create(title: String?, message: String?) -> Self {
        return self.init(title: title, message: message, preferredStyle: .alert)
    }

    public func setAction(for category: RxAlertCategory, item: RxAlertItem?) {
        var confirmTitle = RxAlert.config.yes
        var denyTitle = RxAlert.config.no
        if let alertItem = item as? UIAlertItem {
            confirmTitle = alertItem.confirmTitle
            if let deny = alertItem.denyTitle {
                denyTitle = deny
            }
        }
        switch category {
        case .single(let onConfirm):
            addAction(UIAlertAction(title: confirmTitle, style: .cancel) { _ in
                onConfirm?()
            })
        case .double(let onConfirm, let onDeny):
            addAction(UIAlertAction(title: confirmTitle, style: .destructive) { _ in
                onConfirm?()
            })
            addAction(UIAlertAction(title: denyTitle, style: .cancel) { _ in
                onDeny?()
            })
        }
    }
    
}
