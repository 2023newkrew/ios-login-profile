//
//  ProfileViewController.swift
//  LoginProfile
//
//  Created by kakao on 2023/01/05.
//

import UIKit

class ProfileViewController: UIViewController {
    private let menuView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.distribution = .equalCentering
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = .init(top: 20,
                                                   leading: 50,
                                                   bottom: 0,
                                                   trailing: 50)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let closeButton = CloseButton()
    private let wonButton = WonButton()
    private let giftButton = GiftButton()
    private let favoriteButton = FavouriteButton()
    
    private let profileImageView: UIImageView = {
        let image = UIImage(named: "loopy")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "루피"
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let chatTouchableView: TouchableView = {
        let view = TouchableView()
        view.setImage(name: "btn_bubble")
        view.setLabel(title: "1:1 채팅")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let callTouchableView: TouchableView = {
        let view = TouchableView()
        view.setImage(name: "btn_phone")
        view.setLabel(title: "통화하기")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let storyTouchableView: TouchableView = {
        let view = TouchableView()
        view.setImage(name: "btn_quote")
        view.setLabel(title: "카카오스토리")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
        setHierarchy()
        setLayout()
    }
    
    private func setAttributes() {
        view.backgroundColor = .black
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        wonButton.translatesAutoresizingMaskIntoConstraints = false
        giftButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setHierarchy() {
        [chatTouchableView, callTouchableView, storyTouchableView].forEach { touchableView in
            menuView.addArrangedSubview(touchableView)
        }
        
        [closeButton, giftButton, wonButton,
         favoriteButton, profileImageView, profileLabel,
         seperatorView, menuView].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 22),
            closeButton.heightAnchor.constraint(equalToConstant: 22),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: 22),
            
            favoriteButton.widthAnchor.constraint(equalToConstant: 26),
            favoriteButton.heightAnchor.constraint(equalToConstant: 26),
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                 constant: 18),
            favoriteButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -16),
            
            wonButton.widthAnchor.constraint(equalToConstant: 26),
            wonButton.heightAnchor.constraint(equalToConstant: 26),
            wonButton.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -12),
            wonButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 18),
            
            giftButton.widthAnchor.constraint(equalToConstant: 26),
            giftButton.heightAnchor.constraint(equalToConstant: 26),
            giftButton.trailingAnchor.constraint(equalTo: wonButton.leadingAnchor, constant: -12),
            giftButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 18),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.topAnchor.constraint(equalTo: giftButton.bottomAnchor, constant: 395),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            seperatorView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 51),
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
            seperatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            seperatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            menuView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
