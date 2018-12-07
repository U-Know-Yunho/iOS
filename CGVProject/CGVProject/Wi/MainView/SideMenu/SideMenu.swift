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
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension SideMenu: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        default:
            break
        }
        return cell
    }
}
