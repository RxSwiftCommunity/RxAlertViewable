//
//  RxAlertViewable.swift
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

public protocol RxAlertViewable {}

extension RxAlertViewable where Self: UIViewController {
    
    public func showAlert(_ alert: RxAlert) {
        present(alert.alertController, animated: true)
    }
    
    public func showActionSheet(_ actionSheet: RxActionSheet) {
        present(actionSheet.alertController, animated: true)
    }
    
}

extension RxAlertViewable where Self: AnyObject {
    
    public func showGlobalAlert(_ alert: RxAlert) {
        let viewController = UIViewController()
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = viewController
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        alertWindow.makeKeyAndVisible()
        GlobalWindowHolder.shared.alertWindow = alertWindow
        viewController.present(alert.alertController, animated: true)
    }
    
}

class GlobalWindowHolder {
    static let shared = GlobalWindowHolder()
    
    private var timer: Timer?
    
    var alertWindow: UIWindow? {
        didSet {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                if self.alertWindow?.rootViewController?.presentedViewController == nil {
                    self.timer?.invalidate()
                    self.alertWindow = nil
                }
            }
        }
    }
}
