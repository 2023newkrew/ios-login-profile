//
//  LoginProfile - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var findAccountOrPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDynamicTypes()
        setLocalized()
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc
    private func textFieldDidChange() {
        guard let idText = idTextField.text else { return }
        if idText.count >= Constants.idMinimumLength {
            signInButton.backgroundColor = .systemYellow
        } else {
            signInButton.backgroundColor = .systemGray6
        }
    }
    
    private func setLocalized() {
        welcomeLabel.text = LocalizedLiteral.welcome.localized
        infoLabel.text = LocalizedLiteral.info.localized
        
        idTextField.placeholder = LocalizedLiteral.idText.localized
        passwordTextField.placeholder = LocalizedLiteral.passwordText.localized
        
        signInButton.setTitle(LocalizedLiteral.idText.localized, for: .normal)
        signUpButton.setTitle(LocalizedLiteral.passwordText.localized, for: .normal)
        findAccountOrPasswordButton.setTitle(LocalizedLiteral.findAccount.localized, for: .normal)
    }
    
    private func setDynamicTypes() {
        welcomeLabel.adjustsFontForContentSizeCategory = true
        infoLabel.adjustsFontForContentSizeCategory = true
        
        idTextField.adjustsFontForContentSizeCategory = true
        passwordTextField.adjustsFontForContentSizeCategory = true
        
        signInButton
            .titleLabel?
            .adjustsFontForContentSizeCategory = true
        signUpButton
            .titleLabel?
            .adjustsFontForContentSizeCategory = true
        findAccountOrPasswordButton
            .titleLabel?
            .adjustsFontForContentSizeCategory = true
    }
}

fileprivate enum Constants {
    static let idMinimumLength = 5
}