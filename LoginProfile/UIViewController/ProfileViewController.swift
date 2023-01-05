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
        static let bottomMenuStackViewHeight = CGFloat(56)
        static let bottomMenuStackViewItemHorizontalSpace = CGFloat(30)
        static let bottomMenuStackViewVerticalSpace = CGFloat(64)
        static let bottomMenuStackViewHorizontalSpace = CGFloat(25)
//        static let bottomMenuStackViewHeight = CGFloat(40)
    }
    
    enum BottomMenuImageName {
        static let messageIcon = "messageIcon"
        static let phoneCallIcon = "phoneCallIcon"
        static let kakaoStoryIcon = "kakaoStoryIcon"
    }
    
    enum BottomMenuItemText {
        static let message = "1:1 채팅"
        static let phoneCall = "통화하기"
        static let kakaoStory = "카카오스토리"
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
    private var giftButton: UIButton = GiftButton()
    private var wonButton: UIButton = WonButton()
    private var favouriteButton: UIButton = FavouriteButton()
    
    private var bottmMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = Constant.bottomMenuStackViewItemHorizontalSpace
        return stackView
    }()
    private var messageBottomMenuItemView = BottomMenuItemView(imageName: BottomMenuImageName.messageIcon, text: BottomMenuItemText.message, frame: CGRect())
    private var phoneCallBottomMenuItemView = BottomMenuItemView(imageName: BottomMenuImageName.phoneCallIcon, text: BottomMenuItemText.phoneCall, frame: CGRect())
    private var kakaoStoryBottomMenuItemView = BottomMenuItemView(imageName: BottomMenuImageName.kakaoStoryIcon, text: BottomMenuItemText.kakaoStory, frame: CGRect())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        self.closeButton.addTarget(self, action: #selector(closeButtonTouched(sender:)), for: .touchUpInside)
        
        self.configureCloseButtonLayout()
        self.configureTopMenuStackViewLayout()
        self.configureTopMenuStackViewItems()
        self.configureBottomMenuStackViewLayout()
        self.configureBottomMenuStackViewItems()
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
    
    func configureCloseButtonLayout() {
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.closeButton)
        NSLayoutConstraint.activate([
            self.closeButton.leadingAnchor.constraint(equalTo: self.safeAreaLeadingAnchor, constant: Constant.closeButtonLeftSpace),
            self.closeButton.widthAnchor.constraint(equalToConstant: Constant.closeButtonSize),
            self.closeButton.heightAnchor.constraint(equalToConstant: Constant.closeButtonSize),
            self.closeButton.centerYAnchor.constraint(equalTo: self.safeAreaTopAnchor, constant: Constant.topIconVerticalSpace)
        ])
    }
    
    func configureTopMenuStackViewLayout() {
        self.topMenuStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.topMenuStackView)
        NSLayoutConstraint.activate([
            self.topMenuStackView.trailingAnchor.constraint(equalTo: self.safeAreaTrailingAnchor, constant: -Constant.topMenuStackViewHorizontalSpace),
            self.topMenuStackView.centerYAnchor.constraint(equalTo: self.safeAreaTopAnchor, constant: Constant.topIconVerticalSpace),
            self.topMenuStackView.heightAnchor.constraint(equalToConstant: Constant.topMenuStackViewHeight)
        ])
    }
    
    func configureTopMenuStackViewItems() {
        let buttons = [self.giftButton, self.wonButton, self.favouriteButton]
        buttons.forEach {
            self.topMenuStackView.addArrangedSubview($0)
        }
    }
    
    func configureBottomMenuStackViewLayout() {
        self.bottmMenuStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.bottmMenuStackView)
        NSLayoutConstraint.activate([
            self.bottmMenuStackView.leadingAnchor.constraint(equalTo: safeAreaLeadingAnchor, constant: Constant.bottomMenuStackViewHorizontalSpace),
            self.bottmMenuStackView.trailingAnchor.constraint(equalTo: safeAreaTrailingAnchor, constant: -Constant.bottomMenuStackViewHorizontalSpace),
            self.bottmMenuStackView.bottomAnchor.constraint(equalTo: safeAreaBottomAnchor, constant: -Constant.bottomMenuStackViewVerticalSpace),
            self.bottmMenuStackView.heightAnchor.constraint(equalToConstant: Constant.bottomMenuStackViewHeight)
        ])
    }
    
    func configureBottomMenuStackViewItems() {
        let items = [self.messageBottomMenuItemView, self.phoneCallBottomMenuItemView, self.kakaoStoryBottomMenuItemView]
        items.forEach {
            self.bottmMenuStackView.addArrangedSubview($0)
        }
    }
}

extension ProfileViewController {
    @objc func closeButtonTouched(sender: UIButton) {
        self.dismiss(animated: true)
    }
}
