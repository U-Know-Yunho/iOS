//
//  CastTableViewCell.swift
//  LoginView
//
//  Created by Maru on 30/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    var castPhoto: [String] = ["Bryan Singer", "Rami Malek", "Lucy Boynton", "Gwilym Lee"]
    @IBOutlet weak var castCollectionView: UICollectionView!
    var castEnglishName: [MovieDetail.Cast]? {
        didSet {
            self.castCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        castCollectionView.dataSource = self
        castCollectionView.delegate = self
        castCollectionView.register(UINib(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCollectionViewCell")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CastTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castEnglishName?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCollectionViewCell", for: indexPath) as! CastCollectionViewCell
        
        cell.castImageView.image = UIImage(named: castPhoto[indexPath.row])
        cell.castImageView.layer.cornerRadius = cell.castImageView.frame.height / 2
        cell.castImageView.layer.borderWidth = 1
        cell.castImageView.layer.borderColor = UIColor.clear.cgColor
        cell.castImageView.clipsToBounds = true
        
        cell.castEnglishName.text = castEnglishName?[indexPath.item].actor
        
        
        return cell
    }
    
    // collectionViewCell 아이템 사이즈 지정 !
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        let height = collectionView.bounds.height / 3
        return CGSize(width: width, height: height)
    }
    
}
