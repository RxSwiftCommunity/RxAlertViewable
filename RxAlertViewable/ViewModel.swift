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
        return clickTimes.map {
            RxAlertType.tip(message: "Clicked \($0) time\($0 > 1 ? "s" : "").")
        }
    }
    
    func alert() {
        clickTimes.accept(clickTimes.value + 1)
    }
    
}
