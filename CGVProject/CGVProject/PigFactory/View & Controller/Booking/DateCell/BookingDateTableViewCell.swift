//
//  BookingDateTabelViewCell.swift
//  CGVProject
//
//  Created by PigFactory on 27/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class BookingDateTableViewCell: UITableViewCell {

    @IBOutlet weak var bookingDateCollectionView: UICollectionView!
    var timeTableInCell = ""
}

extension BookingDateTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingDateCollectionViewCell", for: indexPath) as! BookingDateCollectionViewCell
        return cell
    }
}
