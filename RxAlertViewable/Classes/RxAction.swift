//
//  RxActionSheet.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2021/01/17.
//  Copyright © 2021 MuShare. All rights reserved.
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

public enum RxAction {
    case `default`(title: String, action: RxAlertCompletion)
    case destructive(title: String, action: RxAlertCompletion)
    case customCancel(title: String)
    case cancel
    
    var alertAction: UIAlertAction {
        switch self {
        case .default(let title, let action):
            return UIAlertAction(title: title, style: .default) { _ in
                action?()
            }
        case .destructive(let title, let action):
            return UIAlertAction(title: title, style: .destructive) { _ in
                action?()
            }
        case .customCancel(let title):
            return UIAlertAction(title: title, style: .cancel)
        case .cancel:
            return UIAlertAction(title: RxActionSheet.config.cancel, style: .cancel)
        }
    }
}
