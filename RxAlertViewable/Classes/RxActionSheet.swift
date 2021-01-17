//
//  RxActionSheet.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2019/05/21.
//  Copyright © 2019 MuShare. All rights reserved.
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

public struct RxActionSheetConfig {
    var cancel: String
    var tintColor: UIColor?
    
    public init(cancel: String? = nil, tintColor: UIColor? = nil) {
        self.cancel = cancel ?? RxAlertConfig.current.cancel
        self.tintColor = tintColor
    }
}

public struct RxActionSheet {
    
    public static var config = RxActionSheetConfig()
    
    private var title: String?
    private var message: String?
    private var sourceView: UIView?
    private var actions: [RxAction]
    
    public var alertController: UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach {
            alertController.addAction($0.alertAction)
        }
        if let tintColor = RxAlertConfig.current.tintColor {
            alertController.view.tintColor = tintColor
        }
        if let view = sourceView {
            alertController.popoverPresentationController?.sourceView = view
            alertController.popoverPresentationController?.sourceRect = view.bounds
        }
        // The constraints layout warning is a bug caused by iOS from 12.2.
        // We can just remove it, until Apple has fixed the bug.
        alertController.view.subviews.forEach { subview in
            subview.constraints.filter {
                $0.debugDescription.contains("width == - 16")
            }.forEach {
                subview.removeConstraint($0)
            }
        }
        return alertController
    }
    
}

extension RxActionSheet {
    
    public static func actions(
        sourceView: UIView? = nil,
        title: String? = nil,
        message: String? = nil,
        actions: [RxAction]
    ) -> RxActionSheet {
        self.init(title: title, message: message, sourceView: sourceView, actions: actions)
    }
    
    public static func actions(
        sourceView: UIView? = nil,
        title: String? = nil,
        message: String? = nil,
        _ actions: RxAction...
    ) -> RxActionSheet {
        self.init(title: title, message: message, sourceView: sourceView, actions: actions)
    }
    
}
