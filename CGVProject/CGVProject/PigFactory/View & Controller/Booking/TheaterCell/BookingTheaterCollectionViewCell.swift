//
//  BookingTheaterCollectionViewCell.swift
//  CGVProject
//
//  Created by PigFactory on 28/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class BookingTheaterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var theaterTimeTable: UILabel!
    @IBOutlet weak var theaterSeat: UILabel!
    var model: BookingTheaterModel! {
        didSet {
            theaterTimeTable.text = model.times
            theaterSeat.text = String(model.currentSeat ?? 0)
        }
    }
    
    override func awakeFromNib() {
        theaterTimeTable.isUserInteractionEnabled = true
        theaterTimeTable.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(theaterTimeTableDidtap)))
        theaterTimeTable.layer.cornerRadius = theaterTimeTable.frame.height / 4
        theaterTimeTable.layer.borderWidth = 0.5
    }
    
    @objc private func theaterTimeTableDidtap(){
        let dic = ["pk": model.pk]
        NotificationCenter.default.post(name: NSNotification.Name("theaterTimeTableDidTap"), object: nil, userInfo: dic)
    }
}
