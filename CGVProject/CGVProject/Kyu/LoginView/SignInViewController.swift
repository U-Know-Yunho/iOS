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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
                self.postKakaoUserId()
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
            }
    
    // 카카오 로그인 시 카카오 ID로 토큰 받기
    func postKakaoUserId() {
        KOSessionTask.userMeTask { [weak self] (error, userMe) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            guard let me = userMe,
                let id = me.id else { return }
            let param: Parameters = ["user_id" : "1234", "last_name": "afsdf", "first_name": "sadfaf", "email": "dasifl", "phone_number": "czvzv"]
            print(id)
            
            let header: HTTPHeaders = ["Content-Type" : "application/json"]
            Alamofire.request(API.AuthURL.socialSignIn, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header)
                .validate(statusCode: 200...300)
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        print("token :", value)
                        guard let token = value as? [String: String] else { return print("token parsing error")}
                        UserManager.singleton.token = token["token"]
                       print("\n------------ [ success ] -------------\n")
                        print(UserManager.singleton.hasToken)
                        
                    case .failure(let error):
                        print("\n------------ [ fail ] -------------\n")
                        print(error.localizedDescription)
                        
                    }
                })
            
        }
    }

    
    @IBAction func logoutButton(_ sender: Any) {
        
        KOSession.shared()?.logoutAndClose(completionHandler: { (success, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            // Logout success
            UserManager.singleton.token = nil
        })
        
        
    }
    
    
    
    
    @IBAction func unwindToSignInViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
}
