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
        
        drawUnderline(of: idTextField)
        drawUnderline(of: passwordTextField)
    }
}

extension LoginViewController {
    func drawUnderline(of textField: UITextField){
        let border = CALayer()
        let underlineWidth = self.view.frame.width - Constant.sideSpace * 2
        border.frame = CGRect(x: 0, y: textField.frame.size.height + Constant.underlineSpace, width: underlineWidth, height: 1)
        border.backgroundColor = UIColor.placeholderText.cgColor
        textField.layer.addSublayer(border)
    }
}

extension LoginViewController {
    @IBAction func idTextFieldChanged(_ sender: Any) {
        guard let textCount = idTextField.text?.count else {
            return
        }
        
        if textCount >= 5 {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(rgb: 0xFBE64C)
            return
        }
        
        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor.systemGray6
    }
}
