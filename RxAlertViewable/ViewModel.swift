//
//  ViewModel.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/11.
//  Copyright © 2018 MuShare. All rights reserved.
//

import RxSwift
import RxCocoa

class ViewModel {
    
    let clickTimes = BehaviorRelay<Int>(value: 0)
    
    var tip: Observable<RxAlertType> {
        return clickTimes.map { times -> RxAlertType in
            let message = "Clicked \(times) time\(times > 1 ? "s" : "")."
            switch times % 5 {
            case 1:
                return .tip(message: message)
            case 2:
                return .customTip(title: "Custom Tip", message: message)
            case 3:
                return .warning(message: message)
            case 4:
                return .error(message: message)
            case 0:
                return .confirm(title: "Confirm", message: message, onConfirm: {
                    self.alert()
                })
            default:
                return .tip(message: "???")
            }
        }
    }
    
    func alert() {
        clickTimes.accept(clickTimes.value + 1)
    }
    
}
