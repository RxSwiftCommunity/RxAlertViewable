//
//  AppDelegate.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/01.
//  Copyright © 2018 MuShare. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        RxAlertViewCreator.instance.config = RxAlertViewConfig(tip: "My Tip", confirm: "My Confirm", warning: "My Warning", error: "My Error",
                                                               yes: "My Yes", no: "My No", ok: "My OK", tintColor: .blue)
        
        let viewModel = ViewModel()
        let viewController = ViewController(viewModel: viewModel)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

