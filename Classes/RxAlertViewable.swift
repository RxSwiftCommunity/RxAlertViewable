//
//  RxAlertViewable.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/09.
//  Copyright © 2018 MuShare. All rights reserved.
//

import UIKit

public protocol RxAlertViewable {}

public extension RxAlertViewable where Self: UIViewController {
    
    public func show(alertController: UIAlertController, completion: (() -> Void)? = nil) {
        present(alertController, animated: true, completion: completion)
    }
    
}
