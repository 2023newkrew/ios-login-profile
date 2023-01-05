//
//  ProfileViewController.swift
//  LoginProfile
//
//  Created by kakao on 2023/01/05.
//

import UIKit

class ProfileViewController: UIViewController {
    private enum Constant {
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
        static let bottomSafeArea = CGFloat(44)
        static let lineVerticalSpace = CGFloat(25)
        static let profileLabelVerticalSpace = CGFloat(76)
        static let profileImageButtonVerticalSpace = CGFloat(15)
        static let profileImageButtonSize = CGFloat(100)
        static let profileImageRadius = CGFloat(Constant.profileImageButtonSize * 0.3)
    }
    
    private enum BottomMenuImageName {
        static let messageIcon = "messageIcon"
        static let phoneCallIcon = "phoneCallIcon"
        static let kakaoStoryIcon = "kakaoStoryIcon"
    }
    
    private enum BottomMenuItemText {
        static let message = "1:1 채팅"
        static let phoneCall = "통화하기"
        static let kakaoStory = "카카오스토리"
    }
    
    private let closeButton: UIButton = CloseButton()
    
    private let topMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = Constant.topMenuStackViewHorizontalSpace
        return stackView
    }()
    private let giftButton: UIButton = GiftButton()
    private let wonButton: UIButton = WonButton()
    private let favouriteButton: UIButton = FavouriteButton()
    
    private let bottomMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = Constant.bottomMenuStackViewItemHorizontalSpace
        return stackView
    }()
    private let messageBottomMenuItemView = BottomMenuItemView(imageName: BottomMenuImageName.messageIcon, text: BottomMenuItemText.message, frame: CGRect())
    private let phoneCallBottomMenuItemView = BottomMenuItemView(imageName: BottomMenuImageName.phoneCallIcon, text: BottomMenuItemText.phoneCall, frame: CGRect())
    private let kakaoStoryBottomMenuItemView = BottomMenuItemView(imageName: BottomMenuImageName.kakaoStoryIcon, text: BottomMenuItemText.kakaoStory, frame: CGRect())
    
    private let profileImageButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = Constant.profileImageRadius
        return button
    }()
    
    private let profileNameLabel = {
        let label = UILabel()
        label.text = "No More View"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        self.closeButton.addTarget(self, action: #selector(closeButtonTouched(sender:)), for: .touchUpInside)
        
        self.configureCloseButtonLayout()
        self.configureTopMenuStackViewLayout()
        self.configureTopMenuStackViewItems()
        self.configureBottomMenuStackViewLayout()
        self.configureBottomMenuStackViewItems()
        self.drawLine()
        self.configureProfileNameLabelLayout()
        self.configureProfileImageButtonLayout()
    }
}

extension ProfileViewController {
    private var safeAreaLeadingAnchor: NSLayoutXAxisAnchor {
        return self.view.safeAreaLayoutGuide.leadingAnchor
    }
    private var safeAreaTrailingAnchor: NSLayoutXAxisAnchor {
        return self.view.safeAreaLayoutGuide.trailingAnchor
    }
    private var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        return self.view.safeAreaLayoutGuide.topAnchor
    }
    private var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        return self.view.safeAreaLayoutGuide.bottomAnchor
    }
    
    private func configureCloseButtonLayout() {
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.closeButton)
        NSLayoutConstraint.activate([
            self.closeButton.leadingAnchor.constraint(equalTo: self.safeAreaLeadingAnchor, constant: Constant.closeButtonLeftSpace),
            self.closeButton.widthAnchor.constraint(equalToConstant: Constant.closeButtonSize),
            self.closeButton.heightAnchor.constraint(equalToConstant: Constant.closeButtonSize),
            self.closeButton.centerYAnchor.constraint(equalTo: self.safeAreaTopAnchor, constant: Constant.topIconVerticalSpace)
        ])
    }
    
    private func configureTopMenuStackViewLayout() {
        self.topMenuStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.topMenuStackView)
        NSLayoutConstraint.activate([
            self.topMenuStackView.trailingAnchor.constraint(equalTo: self.safeAreaTrailingAnchor, constant: -Constant.topMenuStackViewHorizontalSpace),
            self.topMenuStackView.centerYAnchor.constraint(equalTo: self.safeAreaTopAnchor, constant: Constant.topIconVerticalSpace),
            self.topMenuStackView.heightAnchor.constraint(equalToConstant: Constant.topMenuStackViewHeight)
        ])
    }
    
    private func configureTopMenuStackViewItems() {
        let buttons = [self.giftButton, self.wonButton, self.favouriteButton]
        buttons.forEach {
            self.topMenuStackView.addArrangedSubview($0)
        }
    }
    
    private func configureBottomMenuStackViewLayout() {
        self.bottomMenuStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.bottomMenuStackView)
        NSLayoutConstraint.activate([
            self.bottomMenuStackView.leadingAnchor.constraint(equalTo: safeAreaLeadingAnchor, constant: Constant.bottomMenuStackViewHorizontalSpace),
            self.bottomMenuStackView.trailingAnchor.constraint(equalTo: safeAreaTrailingAnchor, constant: -Constant.bottomMenuStackViewHorizontalSpace),
            self.bottomMenuStackView.bottomAnchor.constraint(equalTo: safeAreaBottomAnchor, constant: -Constant.bottomMenuStackViewVerticalSpace),
            self.bottomMenuStackView.heightAnchor.constraint(equalToConstant: Constant.bottomMenuStackViewHeight)
        ])
    }
    
    private func configureBottomMenuStackViewItems() {
        let items = [self.messageBottomMenuItemView, self.phoneCallBottomMenuItemView, self.kakaoStoryBottomMenuItemView]
        items.forEach {
            self.bottomMenuStackView.addArrangedSubview($0)
        }
    }
    
    private func drawLine() {
        let border = CALayer()
        
        let startXPoint = Double(0)
        let startYPoint = self.view.frame.height - (Constant.bottomMenuStackViewHeight + Constant.bottomMenuStackViewVerticalSpace + Constant.bottomSafeArea + Constant.lineVerticalSpace)
        let lineWidth = self.view.frame.width
        let lineHeight = Double(1)
        let lineAlpha = CGFloat(0.3)
        
        border.frame = CGRect(x: startXPoint, y: startYPoint, width: lineWidth, height: lineHeight)
        border.backgroundColor = UIColor.white.withAlphaComponent(lineAlpha).cgColor
        
        self.view.layer.addSublayer(border)
    }
    
    private func configureProfileNameLabelLayout() {
        self.profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.profileNameLabel)
        NSLayoutConstraint.activate([
            self.profileNameLabel.bottomAnchor.constraint(equalTo: self.bottomMenuStackView.topAnchor, constant: -Constant.profileLabelVerticalSpace),
            self.profileNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func configureProfileImageButtonLayout() {
        self.profileImageButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.profileImageButton)
        NSLayoutConstraint.activate([
            self.profileImageButton.bottomAnchor.constraint(equalTo: self.profileNameLabel.topAnchor, constant: -Constant.profileImageButtonVerticalSpace),
            self.profileImageButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.profileImageButton.widthAnchor.constraint(equalToConstant: Constant.profileImageButtonSize),
            self.profileImageButton.heightAnchor.constraint(equalToConstant: Constant.profileImageButtonSize)
        ])
    }
}

extension ProfileViewController {
    @objc private func closeButtonTouched(sender: UIButton) {
        self.dismiss(animated: true)
    }
}
