//
//  ViewController.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/01.
//  Copyright © 2018 MuShare. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class ViewController: UIViewController, RxAlertViewable {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Open Alert View", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.rx.tap.bind { [unowned self] in
            self.viewModel.alert()
            }.disposed(by: disposeBag)
        return button
    }()
    
    private let viewModel: ViewModel
    private let disposeBag = DisposeBag()
    
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
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(200)
        }
        
        viewModel.tip.bind(to: rx.alert).disposed(by: disposeBag)
    }


}

