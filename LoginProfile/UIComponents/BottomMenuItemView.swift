//
//  BottomMenuItemStackView.swift
//  LoginProfile
//
//  Created by kakao on 2023/01/05.
//

import UIKit

class BottomMenuItemView: UIView {
    enum Constant {
        static let imageViewSize = CGFloat(24)
        static let zeroSpace = CGFloat(0)
        static let itemVerticalSpace = CGFloat(15)
    }
    
    private var imageView: UIImageView = UIImageView()
    private var textLabel: UILabel = UILabel()
    
    init(imageName: String, text: String, frame: CGRect) {
        super.init(frame: frame)
        self.configureItems(imageName: imageName, text: text)
        self.configureLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureLayout()
    }
}

extension BottomMenuItemView {
    func configureItems(imageName: String, text: String) {
        self.configureImageView(imageName: imageName)
        self.configureTextLabel(text: text)
    }
    
    func configureImageView(imageName: String) {
        guard let image = UIImage(named: imageName) else {
            return
        }
        self.imageView.image = image
    }
    
    func configureTextLabel(text: String) {
        self.textLabel.text = text
        self.textLabel.textAlignment = .center
        self.textLabel.textColor = UIColor.white
    }
    
    func configureLayout() {
        self.configureImageViewLayout()
        self.configureTextLabelLayout()
    }

    func configureImageViewLayout() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.imageView)
        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: Constant.imageViewSize),
            self.imageView.heightAnchor.constraint(equalToConstant: Constant.imageViewSize),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constant.zeroSpace)
        ])
    }
    
    func configureTextLabelLayout() {
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.textLabel)
        NSLayoutConstraint.activate([
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.zeroSpace),
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constant.zeroSpace),
            self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constant.zeroSpace),
        ])
    }
}
