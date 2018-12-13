//
//  PersonalInfoSettingViewController.swift
//  CGVProject
//
//  Created by Wi on 13/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class PersonalInfoSettingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonDidTap(_ sender: Any) {
        UserManager.singleton.signOut(completion: {
            NotificationCenter.default.post(name: NSNotification.Name("LogoutBtnDidtap"), object: self)
            self.navigationController?.popViewController(animated: true)
        })
    }
    
}

extension PersonalInfoSettingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "회원정보수정"
            return cell
        case 1:
            break
        default:break
        }
        return UITableViewCell()
    }
    
    
}
