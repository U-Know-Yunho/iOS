//
//  CancelMembershipViewController.swift
//  CGVProject
//
//  Created by Wi on 13/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class CancelMembershipViewController: UIViewController {
    @IBOutlet weak var cancelMembershipBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelMembershipBtn.layer.cornerRadius = 20
        self.title = "회원 탈퇴"
    }
    @IBAction func cancelMembershipBtnDidTap(_ sender: Any) {
        
    }
}
