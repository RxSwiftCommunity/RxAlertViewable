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
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Alert View", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.rx.tap.bind { [unowned self] in
            self.viewModel.alert()
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var globalAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Global Alert View", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.rx.tap.bind { [unowned self] in
            self.viewModel.globalAlert()
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
        view.addSubview(alertButton)
        view.addSubview(globalAlertButton)
        createConstraints()
        
        viewModel.tip.bind(to: rx.alert).disposed(by: disposeBag)
        viewModel.globalTip.bind(to: rx.globalAlert).disposed(by: disposeBag)
    }

    private func createConstraints() {
        alertButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        globalAlertButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(alertButton.snp.bottom).offset(20)
        }
    }

}

