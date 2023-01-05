//
//  ProfileViewController.swift
//  LoginProfile
//
//  Created by kakao on 2023/01/05.
//

import UIKit

class ProfileViewController: UIViewController {
    enum Constant {
        static let closeButtonSize = CGFloat(22)
        static let closeButtonLeftSpace = CGFloat(22)
        static let topIconVerticalSpace = CGFloat(20) + (closeButtonLeftSpace/2)
        static let topMenuStackViewHorizontalSpace = CGFloat(12)
        static let topMenuStackViewButtonSize = CGFloat(26)
        static let topMenuStackViewWidth = topMenuStackViewButtonSize * 3 + topMenuStackViewHorizontalSpace * 2
        static let topMenuStackViewHeight = CGFloat(26)
    }
    
    private var closeButton: UIButton = CloseButton()
    private var topMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = Constant.topMenuStackViewHorizontalSpace
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        self.closeButton.addTarget(self, action: #selector(closeButtonTouched(sender:)), for: .touchUpInside)
        
        self.configureCloseButton()
        self.configureTopMenuStackView()
    }
}

extension ProfileViewController {
    var safeAreaLeadingAnchor: NSLayoutXAxisAnchor {
        return self.view.safeAreaLayoutGuide.leadingAnchor
    }
    var safeAreaTrailingAnchor: NSLayoutXAxisAnchor {
        return self.view.safeAreaLayoutGuide.trailingAnchor
    }
    var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        return self.view.safeAreaLayoutGuide.topAnchor
    }
    var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        return self.view.safeAreaLayoutGuide.bottomAnchor
    }
    
    func configureCloseButton() {
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.closeButton)
        NSLayoutConstraint.activate([
            self.closeButton.leadingAnchor.constraint(equalTo: self.safeAreaLeadingAnchor, constant: Constant.closeButtonLeftSpace),
            self.closeButton.widthAnchor.constraint(equalToConstant: Constant.closeButtonSize),
            self.closeButton.heightAnchor.constraint(equalToConstant: Constant.closeButtonSize),
            self.closeButton.centerYAnchor.constraint(equalTo: self.safeAreaTopAnchor, constant: Constant.topIconVerticalSpace)
        ])
    }
    
    func configureTopMenuStackView() {
        self.topMenuStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.topMenuStackView)
        NSLayoutConstraint.activate([
            self.topMenuStackView.trailingAnchor.constraint(equalTo: self.safeAreaTrailingAnchor, constant: -Constant.topMenuStackViewHorizontalSpace),
            self.topMenuStackView.centerYAnchor.constraint(equalTo: self.safeAreaTopAnchor, constant: Constant.topIconVerticalSpace),
            self.topMenuStackView.widthAnchor.constraint(equalToConstant: Constant.topMenuStackViewWidth),
            self.topMenuStackView.heightAnchor.constraint(equalToConstant: Constant.topMenuStackViewHeight)
        ])
    }
}

extension ProfileViewController {
    @objc func closeButtonTouched(sender: UIButton) {
        self.dismiss(animated: true)
    }
}
