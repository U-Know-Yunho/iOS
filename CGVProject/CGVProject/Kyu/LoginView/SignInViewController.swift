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
                
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
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
