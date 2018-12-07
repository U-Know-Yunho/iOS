//
//  StillcutTableViewCell.swift
//  CGVProject
//
//  Created by Maru on 05/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class StillcutTableViewCell: UITableViewCell {

    var stillcutPhoto: [String] = ["001", "002", "003", "004", "005", "006", "sample1", "sample2", "sample3", "sample4"]
    
    @IBOutlet weak var stillcutCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       stillcutCollectionViewCell.dataSource = self
        stillcutCollectionViewCell.delegate = self
        stillcutCollectionViewCell.register(UINib(nibName: "StillcutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StillcutCollectionViewCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension StillcutTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stillcutPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StillcutCollectionViewCell", for: indexPath) as! StillcutCollectionViewCell
        cell.stillcutImageView.image = UIImage(named: stillcutPhoto[indexPath.row])
        return cell
    }
    
}

extension StillcutTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
}
