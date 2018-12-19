//
//  BookingTheaterCollectionViewCell.swift
//  CGVProject
//
//  Created by PigFactory on 28/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class BookingTheaterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var theaterTimeTable: UIButton!
    @IBOutlet weak var theaterSeat: UILabel!
    
    
    override func awakeFromNib() {
        theaterTimeTable.layer.cornerRadius = theaterTimeTable.frame.height / 4
        theaterTimeTable.layer.borderWidth = 0.5
    }
    
    var model: BookingTheaterModel? {
        
        didSet {
            theaterTimeTable.setTitle(model?.times, for: UIControl.State.normal)
            theaterSeat.text = String(model?.currentSeat ?? 0)
        }
    }
}
