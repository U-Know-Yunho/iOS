//
//  InsideCollectionViewCell.swift
//  CGVProject
//
//  Created by PigFactory on 26/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class BookingPosterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookingPosterView: UIImageView!
    
    override func awakeFromNib() {
        bookingPosterView.alpha = 0.5
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                bookingPosterView.alpha = 1.0
                bookingPosterView.layer.borderWidth = 3.0
                bookingPosterView.layer.borderColor = UIColor.white.cgColor
            } else {
                transform = CGAffineTransform.identity
                bookingPosterView.layer.borderWidth = 0.0
                bookingPosterView.alpha = 0.5
            }
        }
    }
}
