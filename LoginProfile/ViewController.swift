//
//  LoginProfile - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    enum Constant {
        static let sideSpace = CGFloat(16)
        static let underlineSpace = CGFloat(8.5)
    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawUnderline(of: idTextField)
        drawUnderline(of: passwordTextField)
    }
    
    func drawUnderline(of textField: UITextField){
        let border = CALayer()
        let underlineWidth = self.view.frame.width - Constant.sideSpace * 2
        border.frame = CGRect(x: 0, y: textField.frame.size.height + Constant.underlineSpace, width: underlineWidth, height: 1)
        border.backgroundColor = UIColor.placeholderText.cgColor
        textField.layer.addSublayer(border)
    }
}

