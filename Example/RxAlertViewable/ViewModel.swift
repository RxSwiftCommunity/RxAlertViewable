//
//  ViewModel.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/11.
//  Copyright © 2018 MuShare. All rights reserved.
//

import RxSwift
import RxCocoa
import RxAlertViewable

class ViewModel {
    
    let alert = PublishSubject<RxAlert>()
    let globalTip = PublishSubject<RxAlert>()
    let actionSheet = PublishSubject<RxActionSheet>()
    
    private var clickTimes = 0
    
    func showAlert() {
        clickTimes += 1
        let message = "Clicked \(clickTimes) time\(clickTimes > 1 ? "s" : "")."
        switch clickTimes % 5 {
        case 1:
            alert.onNext(.tip(message))
        case 2:
            alert.onNext(.customTip(title: "Custom Tip", message: message))
        case 3:
            alert.onNext(.warning(message))
        case 4:
            alert.onNext(.error(message))
        case 0:
            alert.onNext(.confirm(message, onConfirm: {
                self.showAlert()
            }))
        default:
            alert.onNext(.tip("???"))
        }
    }
    
    func showCustomizedAlert() {
        alert.onNext(.customConfirm(
            title: "Custom Controller",
            message: "Custom alert",
            item: CustomAlertItem(name: "Meng Li", avatar: URL(string: "https://avatars0.githubusercontent.com/u/9463655")),
            confirmTitle: "OK",
            denyTitle: "Cancel",
            onConfirm: nil,
            onDeny: nil
        ))
    }
    
    func showGlobalAlert() {
        globalTip.onNext(.confirm("Confirm message.", onConfirm: {
            print("comfirm")
        }, onDeny: {
            print("deny")
        }))
    }
    
    func showActionSheet() {
        actionSheet.onNext(.actions(
            .default(title: "Default", action: {
                print("Default")
            }),
            .destructive(title: "Destructive", action: {
                print("Destructive")
            }),
            .cancel
        ))
    }
}
