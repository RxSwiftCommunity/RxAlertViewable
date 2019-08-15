//
//  RxAlert.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2019/08/15.
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

import RxSwift

extension ObserverType where Element == RxAlert {
    
    public func onNextTip(_ message: String, onConfirm: RxAlertCompletion = nil) {
        onNext(.tip(message, onConfirm: onConfirm))
    }
    
    public func onNextWarning(_ message: String, onConfirm: RxAlertCompletion = nil) {
        onNext(.warning(message, onConfirm: onConfirm))
    }
    
    public func onNextError(_ message: String, onConfirm: RxAlertCompletion = nil) {
        onNext(.error(message, onConfirm: onConfirm))
    }
    
    public func onNextConfirm(
        _ message: String,
        onConfirm: RxAlertCompletion = nil,
        onDeny: RxAlertCompletion = nil
    ) {
        onNext(.confirm(message, onConfirm: onConfirm, onDeny: onDeny))
    }
    
    public func onNextCustomTip(
        title: String,
        message: String,
        item: RxAlertItem? = nil,
        onConfirm: RxAlertCompletion = nil
    ) {
        onNext(.customTip(title: title, message: message, item: item, onConfirm: onConfirm))
    }
    
    public func onNextCustomConfirm(
        title: String,
        message: String,
        item: RxAlertItem? = nil,
        onConfirm: RxAlertCompletion = nil,
        onDeny: RxAlertCompletion = nil
    ) {
        onNext(.customConfirm(title: title, message: message, item: item, onConfirm: onConfirm, onDeny: onDeny))
    }
        
}

extension ObserverType where Element == RxActionSheet {
    
    public func onNextActions(sourceView: UIView? = nil, _ actions: RxAction...) {
        onNext(.actions(sourceView: sourceView, actions: actions))
    }
    
}
