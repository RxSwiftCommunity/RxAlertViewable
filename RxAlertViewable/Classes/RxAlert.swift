//
//  RxAlert.swift
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

public typealias RxAlertCompletion = (() -> ())?

public enum RxAlertCategory {
    case single(onConfirm: RxAlertCompletion)
    case double(onConfirm: RxAlertCompletion, onDeny: RxAlertCompletion)
    case multiple(actions: [RxAction])
}

public struct RxAlert {
    
    private var title: String
    private var message: String
    
    private var item: RxAlertItem?
    private var category: RxAlertCategory
    
    init(
        title: String,
        message: String,
        item: RxAlertItem? = nil,
        category: RxAlertCategory
    ) {
        self.title = title
        self.message = message
        self.item = item
        self.category = category
    }

    var alertController: RxAlertController {
        let controllerType: RxAlertController.Type
        if let item = item {
            controllerType = type(of: item).controllerType
        } else {
            controllerType = UIAlertController.self
        }
        
        let alertController = controllerType.create(title: title, message: message)
        alertController.setAction(for: category, item: item)
        if let tintColor = RxAlertConfig.current.tintColor {
            alertController.view.tintColor = tintColor
        }
        return alertController
    }
    
}

extension RxAlert {
    
    public static func tip(
        _ message: String,
        inputs: [RxAlertInput] = [],
        onConfirm: RxAlertCompletion = nil
    ) -> RxAlert {
        return self.init(
            title: RxAlertConfig.current.tip,
            message: message,
            item: UIAlertItem(
                inputs: inputs,
                confirmTitle: RxAlertConfig.current.ok
            ),
            category: .single(onConfirm: onConfirm)
        )
    }
    
    public static func warning(
        _ message: String,
        inputs: [RxAlertInput] = [],
        onConfirm: RxAlertCompletion = nil
    ) -> RxAlert {
        return self.init(
            title: RxAlertConfig.current.warning,
            message: message,
            item: UIAlertItem(
                inputs: inputs,
                confirmTitle: RxAlertConfig.current.ok
            ),
            category: .single(onConfirm: onConfirm)
        )
    }
    
    public static func error(
        _ message: String,
        inputs: [RxAlertInput] = [],
        onConfirm: RxAlertCompletion = nil
    ) -> RxAlert {
        return self.init(
            title: RxAlertConfig.current.error,
            message: message,
            item: UIAlertItem(
                inputs: inputs,
                confirmTitle: RxAlertConfig.current.ok
            ),
            category: .single(onConfirm: onConfirm)
        )
    }
    
    public static func confirm(
        _ message: String,
        onConfirm: RxAlertCompletion = nil,
        onDeny: RxAlertCompletion = nil
    ) -> RxAlert {
        return self.init(
            title: RxAlertConfig.current.confirm,
            message: message,
            category: .double(onConfirm: onConfirm, onDeny: onDeny)
        )
    }
    
    public static func customTip(
        title: String,
        message: String,
        item: RxAlertItem? = nil,
        onConfirm: RxAlertCompletion = nil
    ) -> RxAlert {
        return self.init(
            title: title,
            message: message,
            item: item,
            category: .single(onConfirm: onConfirm)
        )
    }
    
    public static func customConfirm(
        title: String,
        message: String,
        item: RxAlertItem? = nil,
        onConfirm: RxAlertCompletion = nil,
        onDeny: RxAlertCompletion = nil
    ) -> RxAlert {
        return self.init(
            title: title,
            message: message,
            item: item,
            category: .double(onConfirm: onConfirm, onDeny: onDeny)
        )
    }
    
    public static func multiple(
        title: String,
        message: String,
        actions: [RxAction]
    ) -> RxAlert {
        return self.init(title: title, message: message, category: .multiple(actions: actions))
    }
    
}
