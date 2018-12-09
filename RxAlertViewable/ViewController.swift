//
//  ViewController.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/01.
//  Copyright © 2018 MuShare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }


}

