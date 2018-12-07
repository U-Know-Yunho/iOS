//
//  BookingTheaterCollectionViewCell.swift
//  CGVProject
//
//  Created by PigFactory on 28/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class BookingTheaterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeTable: UIButton!
    override func awakeFromNib() {
        timeTable.layer.cornerRadius = timeTable.frame.height / 4
        timeTable.layer.borderWidth = 1
    }
}
