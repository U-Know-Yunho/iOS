//
//  SideMenu.swift
//  CGVProject
//
//  Created by Wi on 30/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class SideMenu: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        contentView = Bundle.main.loadNibNamed("SideMenu", owner: self, options: nil)?.first! as? UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        tableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: "LoginTableViewCell")
    }
}

extension SideMenu: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell", for: indexPath)
        case 1:
            cell.textLabel?.text = "영화별 예매"
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = .white
            cell.textLabel?.textAlignment = .center
        case 2:
            cell.textLabel?.text = "극장별 예매"
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = .white
            cell.textLabel?.textAlignment = .center
        case 3:
            cell.textLabel?.text = "로그아웃"
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = .white
            cell.textLabel?.textAlignment = .center
        default:
            break
        }
        cell.selectionStyle = .none
        return cell
    }
}
