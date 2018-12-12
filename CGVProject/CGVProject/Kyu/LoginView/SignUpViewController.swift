//
//  SignUpViewController.swift
//  CGVProject
//
//  Created by Maru on 05/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    var successCheckOverlapID = false
    
    // 텍스트 필드 아닌 곳 터치하면 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true) // 이전 뷰로 넘어갈 때 키보드 내리기
    }
    
    @IBAction func checkOverlapIDButton(_ sender: Any) {
        guard let checkID = usernameTextField.text else { return }
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let param: Parameters = ["username": checkID]
        Alamofire.request(API.AuthURL.checkID, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header)
        .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    guard let message = value as? [String: String] else { return }
                    self.alert(message["message"]!)
                    self.successCheckOverlapID = true
                    
                case .failure(let error):
                    self.alert(error.localizedDescription)
                }
        }
        
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if self.successCheckOverlapID == true {
        // 1-2. 전달값을 Parameters 타입의 객체로 정의
        let param: Parameters = [
            "username": self.usernameTextField.text!,
            "password": self.passwordTextField.text!,
            "last_name": self.lastNameTextField.text!,
            "first_name": self.firstNameTextField.text!,
            "email": self.emailTextField.text!,
            "phone_number": self.phoneNumberTextField.text!
        ]
        
        UserManager.singleton.signUp(param: param)
        dismiss(animated: true, completion: nil)
        } else {
            self.alert("ID 중복 검사를 해주세요!")
        }
    }
    
    
    
}
