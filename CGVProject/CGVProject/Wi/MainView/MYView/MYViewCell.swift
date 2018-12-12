//
//  MYViewCell.swift
//  CGVProject
//
//  Created by Wi on 27/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MYViewCell: UICollectionViewCell, SettingInfoTableViewCellDelegate {
    var myViewTableView = UITableView()
    private var refreshControll = UIRefreshControl()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    func configure(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name("LoginButtonDidtap"), object: nil)
        
        // MARK: refreshControl
        myViewTableView.refreshControl = refreshControll
        myViewTableView.separatorColor = .clear
        refreshControll.addTarget(self, action: #selector(tableViewRefresh), for: .valueChanged)
        // MARK: addSubView
        self.addSubview(myViewTableView)
        
        // MARK: register
        myViewTableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfo")
        myViewTableView.register(UINib(nibName: "SettingInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "Info")
        
        // MARK: delegate, dataSource
        
        myViewTableView.dataSource = self
        myViewTableView.delegate = self
        // MARK: autoLayout
        autolayout()
    }
    // MARK: objc func
    @objc private func reloadTableView(){
        myViewTableView.reloadData()
    }
    @objc private func tableViewRefresh(){
        myViewTableView.reloadData()
        refreshControll.endRefreshing()
    }
    
    // MARK: delgate func
    func logoutDidTap() {
        myViewTableView.reloadData()
    }
    // MARK: autolayout
    func autolayout(){
        myViewTableView.translatesAutoresizingMaskIntoConstraints = false
        myViewTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myViewTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myViewTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myViewTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

// MARK: DataSource

extension MYViewCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserManager.singleton.hasToken{
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "UserInfo", for: indexPath)
        case 1:
            let infoCell = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath) as! SettingInfoTableViewCell
            infoCell.delegate = self
            return infoCell
        default: break
            
        }
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MYViewCell: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if !UserManager.singleton.hasToken {
            }
        default:
            break
        }
    }
}
