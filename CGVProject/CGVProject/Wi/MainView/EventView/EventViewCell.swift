//
//  EventViewCell.swift
//  CGVProject
//
//  Created by Wi on 27/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class EventViewCell: UICollectionViewCell {
    let eventScollView = {
        let scrollView = UIScrollView()
//        scrollView.
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    func configure(){
//        self.addSubview(label)
//        
//        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
