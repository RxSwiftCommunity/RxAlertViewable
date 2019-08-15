//
//  ViewController.swift
//  RxAlertViewable
//
//  Created by Meng Li on 2018/12/01.
//  Copyright © 2018 MuShare. All rights reserved.
//

import UIKit
import RxSwift
import RxAlertViewable
import SnapKit

class ViewController: UIViewController, RxAlertViewable {
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Alert View", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.rx.tap.bind { [unowned self] in
            self.viewModel.showAlert()
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var customizedAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Customized Alert View", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        button.rx.tap.bind { [unowned self] in
            self.viewModel.showCustomizedAlert()
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var globalAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Global Alert View", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.rx.tap.bind { [unowned self] in
            self.viewModel.showGlobalAlert()
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var actionSheetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Action Sheet", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.rx.tap.bind { [unowned self] in
            self.viewModel.showActionSheet(for: button)
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
        view.addSubview(customizedAlertButton)
        view.addSubview(globalAlertButton)
        view.addSubview(actionSheetButton)
        createConstraints()
        
        viewModel.alert.bind(to: rx.alert).disposed(by: disposeBag)
        viewModel.globalTip.bind(to: rx.globalAlert).disposed(by: disposeBag)
        viewModel.actionSheet.bind(to: rx.actionSheet).disposed(by: disposeBag)
    }
    
    private func createConstraints() {
        
        alertButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(customizedAlertButton.snp.top).offset(-20)
        }
        
        customizedAlertButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        globalAlertButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(customizedAlertButton.snp.bottom).offset(20)
        }
        
        actionSheetButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(globalAlertButton.snp.bottom).offset(20)
        }
        
    }
    
}

