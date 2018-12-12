//
//  HomePageViewCell.swift
//  CGVProject
//
//  Created by Wi on 27/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {

    var homeTableView  = UITableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    func configure(){
        homeTableView.separatorColor = .clear
        
        // MARK: Delegate,dataSource
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // MARK: AddSubView
        self.addSubview(homeTableView)
        
        // MARK: Cell register
        
        homeTableView.register(UINib(nibName: "TrailerTableViewCell", bundle: nil), forCellReuseIdentifier: "Trailer")
        homeTableView.register(UINib(nibName: "MovieChartTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieChart")
        homeTableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "Event")
        
        // MARK: AutoLayout
        autolayout()
    }
    func autolayout(){
        // MARK: AutoLayout 설정
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
    }
    
}
extension HomeViewCell: UITableViewDataSource{
    // test용
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "Trailer", for: indexPath) as! TrailerTableViewCell
            cell.clipsToBounds = true
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieChart", for: indexPath) as! MovieChartTableViewCell
            cell.selectionStyle = .none
            return cell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "Event", for: indexPath) as! EventTableViewCell
        default:
            return cell
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension HomeViewCell: UITableViewDelegate {
}
