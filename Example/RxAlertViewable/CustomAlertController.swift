//
//  CustomAlertController.swift
//  RxAlertViewable_Example
//
//  Created by takuji.terada on 2019/07/10.
//  Copyright © 2019 XFLAG. All rights reserved.
//

import UIKit
import RxAlertViewable
import SnapKit
import Kingfisher

struct CustomAlertItem: RxAlertItem {
    var name: String
    var avatar: URL?
}

class CustomAlertController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(onConfirmButton), for: .touchUpInside)
        return button
    }()

    private lazy var denyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(onConfirmButton), for: .touchUpInside)
        return button
    }()

    private lazy var buttonsView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [denyButton, confirmButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()

    private lazy var frameView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor.white.cgColor
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(buttonsView)
        return view
    }()

    private let alertTitle: String?
    private let message: String?
    
    private var onConfirm: RxAlertCompletion = nil
    private var onDeny: RxAlertCompletion = nil
    
    required init(title: String?, message: String?) {
        alertTitle = title
        self.message = message

        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(frameView)

        titleLabel.text = alertTitle
        messageLabel.text = message

        createConstraints()
    }

    private func createConstraints() {
        
        frameView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.center.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }

        messageLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(24)
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.right.equalToSuperview().offset(-24)
        }
        
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(60)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(messageLabel.snp.bottom).offset(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(avatarImageView.snp.bottom).offset(20)
        }

        buttonsView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(24)
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.right.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-30)
        }

        buttonsView.arrangedSubviews.forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(36)
            }
        }
    }

    @objc private func onConfirmButton() {
        dismiss(animated: true) {
            self.onConfirm?()
        }
    }

    @objc private func onDenyButton() {
        dismiss(animated: true) {
            self.onDeny?()
        }
    }
}

extension CustomAlertController: RxAlertController {

    static func create(title: String?, message: String?) -> Self {
        return self.init(title: title, message: message)
    }

    func setAction(for category: RxAlertCategory) {
        switch category {
        case .single(let onConfirm):
            confirmButton.setTitle("OK", for: .normal)
            self.onConfirm = onConfirm
            denyButton.isHidden = true
        case .double(let confirmMessage, let denyMessage, let onConfirm, let onDeny):
            confirmButton.setTitle(confirmMessage, for: .normal)
            self.onConfirm = onConfirm
            denyButton.isHidden = false
            denyButton.setTitle(denyMessage, for: .normal)
            self.onDeny = onDeny
        }
    }
    
    func setItem(_ item: RxAlertItem?) {
        guard let customAlertItem = item as? CustomAlertItem else {
            return
        }
        avatarImageView.kf.setImage(with: customAlertItem.avatar)
        nameLabel.text = customAlertItem.name
    }
    
}
