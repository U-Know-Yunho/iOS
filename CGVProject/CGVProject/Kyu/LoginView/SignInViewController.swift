//
//  SignInViewController.swift
//  LoginView
//
//  Created by Maru on 22/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import Alamofire

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func signInButton(_ sender: Any) {
        
        guard let id = idTextfield.text,
              let password = passwordTextfield.text else { return }
        let param: Parameters = [ "username": id, "password": password]
        
        UserManager.singleton.signIn(param: param)
        // 아이디 검사하는 부분 추가 필요
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func kakaoSignInButton(_ sender: Any) {
        guard let session = KOSession.shared() else { return }
       
        
//        // close old session
        session.isOpen() ? session.close() : ()

        session.open(completionHandler:  { (error) in
//            guard session.isOpen() else {
//                // Open Session field
//                return
//            }

            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        print("Cancelled")
                    default:
                        print(error.localizedDescription)
                    }
                }
            } else {
                print("SignIn Success")
                UserManager.singleton.postKakaoUserId()
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
            }

    
    @IBAction func logoutButton(_ sender: Any) {
        UserManager.singleton.signOut()
    }
    
    
    
    @IBAction func unwindToSignInViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
}
