//
//  RxAlertViewable+Rx.swift
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

#if os(iOS)

import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIViewController, Base: RxAlertViewable {
    
    public var alert: Binder<RxAlert> {
        return Binder(self.base) { viewController, alert in
            viewController.showAlert(alert)
        }
    }
    
    public var actionSheet: Binder<RxActionSheet> {
        return Binder(self.base) { viewControlelr, actionSheet in
            viewControlelr.showActionSheet(actionSheet)
        }
    }
    
}

extension Reactive where Base: AnyObject, Base: RxAlertViewable {
    
    public var globalAlert: Binder<RxAlert> {
        return Binder(self.base) { object, alert in
            object.showGlobalAlert(alert)
        }
    }
    
}

#endif
