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

public protocol RxAlertController: UIViewController {

    static func create(title: String?, message: String?) -> Self

    func setAction(for category: RxAlertCategory)
}

extension UIAlertController: RxAlertController {

    public static func create(title: String?, message: String?) -> Self {
        return self.init(title: title, message: message, preferredStyle: .alert)
    }

    public func setAction(for category: RxAlertCategory) {
        switch category {
        case .single(let onConfirm):
            addAction(UIAlertAction(title: RxAlert.config.ok, style: .cancel) { _ in
                onConfirm?()
            })
        case .double(let comfirmMessage, let denyMessage, let onConfirm, let onDeny):
            addAction(UIAlertAction(title: comfirmMessage, style: .destructive) { _ in
                onConfirm?()
            })
            addAction(UIAlertAction(title: denyMessage, style: .cancel) { _ in
                onDeny?()
            })
        }
    }
}
