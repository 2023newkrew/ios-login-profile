//
//  TouchableView.swift
//  LoginProfile
//
//  Created by kakao on 2023/01/05.
//

import UIKit

class TouchableView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setImage(name: String) {
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    func setLabel(title: String) {
        label.textColor = .white
        label.text = title
    }
    
    private func setHierarchy() {
        [imageView, label].forEach { subView in
            addSubview(subView)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
