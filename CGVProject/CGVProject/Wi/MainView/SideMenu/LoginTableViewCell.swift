//
//  LoginTableViewCell.swift
//  CGVProject
//
//  Created by Wi on 08/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class LoginTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usetNickName: UILabel!
    @IBOutlet weak var howMuchwatchedMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.tintColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
