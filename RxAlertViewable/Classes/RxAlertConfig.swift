//
//  RxAlertConfig.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2020/10/29.
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

public struct RxAlertConfig {
    var tip: String
    var confirm: String
    var warning: String
    var error: String
    var yes: String
    var no: String
    var ok: String
    var cancel: String
    var tintColor: UIColor?
    
    public init(
        tip: String? = nil,
        confirm: String? = nil,
        warning: String? = nil,
        error: String? = nil,
        yes: String? = nil,
        no: String? = nil,
        ok: String? = nil,
        cancel: String? = nil,
        tintColor: UIColor? = nil
    ) {
        self.tip = tip ?? "Tip"
        self.confirm = confirm ?? "Confirm"
        self.warning = warning ?? "Warning"
        self.error = error ?? "Error"
        self.yes = yes ?? "Yes"
        self.no = no ?? "No"
        self.ok = ok ?? "OK"
        self.cancel = cancel ?? "Cancel"
        self.tintColor = tintColor
    }
    
    public static var current = RxAlertConfig()
}
