//
//  LoginProfile - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class LoginViewController: UIViewController {
    enum Constant {
        static let sideSpace = CGFloat(16)
        static let underlineSpace = CGFloat(8.5)
    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.drawUnderline(of: idTextField)
        self.drawUnderline(of: passwordTextField)
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let profileViewController = ProfileViewController()
        profileViewController.modalPresentationStyle = .fullScreen
        self.present(profileViewController, animated: true)
    }
}

extension LoginViewController {
    func drawUnderline(of textField: UITextField) {
        let border = CALayer()
        let underlineWidth = self.view.frame.width - Constant.sideSpace * 2
        border.frame = CGRect(x: 0, y: textField.frame.size.height + Constant.underlineSpace, width: underlineWidth, height: 1)
        border.backgroundColor = UIColor.placeholderText.cgColor
        textField.layer.addSublayer(border)
    }
}

extension LoginViewController {
    @IBAction func idTextFieldChanged(_ sender: UITextField) {
        guard let textCount = self.idTextField.text?.count else {
            return
        }
        
        if textCount >= 5 {
            self.loginButton.isEnabled = true
            self.loginButton.backgroundColor = UIColor(rgb: 0xFBE64C)
            return
        }
        
        self.loginButton.isEnabled = false
        self.loginButton.backgroundColor = UIColor.systemGray6
    }
}
