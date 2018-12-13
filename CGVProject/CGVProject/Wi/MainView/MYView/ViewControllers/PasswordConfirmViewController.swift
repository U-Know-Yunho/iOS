//
//  PasswordConfirmViewController.swift
//  CGVProject
//
//  Created by Wi on 13/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class PasswordConfirmViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordNotConfirm: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordNotConfirm.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func xButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okButtonDidTap(_ sender: Any) {
        UserManager.singleton.checkPW(password: passwordTextField.text ?? "") { (isSuccess) in
            if isSuccess {
                // 회원정보 수정화면
                return
            }
            self.passwordTextField.borderStyle = .bezel
            self.passwordTextField.text = ""
            self.passwordNotConfirm.alpha = 1
            self.passwordTextField.layer.borderColor = UIColor.red.cgColor
        }
        
    }
    
    @IBAction func cancelButtonDidtap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
