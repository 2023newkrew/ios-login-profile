//
//  ProfileViewController.swift
//  LoginProfile
//
//  Created by kakao on 2023/01/05.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let upperMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let lowerMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let closeButton = CloseButton()
    let wonButton = WonButton()
    let giftButton = GiftButton()
    let favouriteButton = FavouriteButton()
    
    let profileImageView: UIImageView = {
        let image = UIImage(named: "loopy")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let chatButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "btn_bubble")
        button.setImage(image, for: .normal)
        return button
    }()
    
    let chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let callButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "btn_phone")
        button.setImage(image, for: .normal)
        return button
    }()
    
    let callLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let storyButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "btn_qoute")
        button.setImage(image, for: .normal)
        return button
    }()
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
