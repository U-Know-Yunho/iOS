//
//  MainTableViewCell.swift
//  CGVProject
//
//  Created by PigFactory on 26/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {
    
    let images = ["001", "002", "003", "004", "005", "006"]
    @IBOutlet weak var bookingPosterCollectionView: UICollectionView!
    
}

extension BookingTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingPosterCollectionViewCell", for: indexPath) as! BookingPosterCollectionViewCell
        cell.bookingPosterView.image = UIImage(named: images[indexPath.item])
        return cell
    }
}
