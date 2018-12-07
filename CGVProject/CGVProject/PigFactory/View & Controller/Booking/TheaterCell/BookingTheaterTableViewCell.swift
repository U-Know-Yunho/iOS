//
//  BookingTheaterTableViewCell.swift
//  CGVProject
//
//  Created by PigFactory on 28/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class BookingTheaterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeTableCollectionCell: UICollectionView!
    
    var timeTable = ""
    
    override func awakeFromNib() {
    }
}

extension BookingTheaterTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingTheaterCollectionViewCell", for: indexPath) as! BookingTheaterCollectionViewCell
        cell.timeTable.setTitle(timeTable, for: .normal)
        
        return cell
    }
}
