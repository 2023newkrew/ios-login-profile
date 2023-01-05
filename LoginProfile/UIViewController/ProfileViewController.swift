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
        static let closeButtonTopSpace = CGFloat(20) + (closeButtonLeftSpace/2)
    }
    
    private var closeButton: UIButton = CloseButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        self.closeButton.addTarget(self, action: #selector(closeButtonTouched(sender:)), for: .touchUpInside)
        
        self.configureCloseButton()
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
            self.closeButton.centerYAnchor.constraint(equalTo: self.safeAreaTopAnchor, constant: Constant.closeButtonTopSpace)
        ])
    }
}

extension ProfileViewController {
    @objc func closeButtonTouched(sender: UIButton) {
        self.dismiss(animated: true)
    }
}
