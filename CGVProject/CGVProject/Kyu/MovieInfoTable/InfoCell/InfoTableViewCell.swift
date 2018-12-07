//
//  InfoTableViewCell.swift
//  LoginView
//
//  Created by Maru on 30/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runningTimeLabel: UILabel!
    @IBOutlet weak var openDateLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func setInfoLabel(movieInfo: MovieDetailInfo) {
        directorLabel.text = movieInfo.director
        actorLabel.text = movieInfo.actor
        genreLabel.text = movieInfo.genre
        runningTimeLabel.text = movieInfo.runningTime
        openDateLabel.text = movieInfo.openDate
        
    }
    
}
