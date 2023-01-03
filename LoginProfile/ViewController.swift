//
//  LoginProfile - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
/*
 String Text 만들어서 매핑?
 StoryBoard 사용해서 하는 방식?
 */

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
        idTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ sender: Any?) {
        guard let idText = idTextField.text else { return }
        if idText.count >= 5 {
            signInButton.backgroundColor = .systemYellow
        } else {
            signInButton.backgroundColor = .systemGray6
        }
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
