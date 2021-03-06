//
//  TrailerTableViewCell.swift
//  CGVProject
//
//  Created by Wi on 28/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
import YouTubePlayer_Swift

class TrailerTableViewCell: UITableViewCell {

    @IBOutlet weak var trailerView: YouTubePlayerView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var showDetail: UIButton!
    var youtubeVideoID: String = "bLoO0FSXncg"
    
//    var model: Trailer! {
//        // 트레일러 데이터 연결작업 필요 
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        trailerView.playerVars = ["playsinline": 1 as AnyObject]
//        let myVideoURL = NSURL(string: youtubeURL )
        trailerView.loadVideoID(youtubeVideoID)
        profileImageView.image = UIImage(named: "test")
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.layer.masksToBounds = true
        
        title.text = "매드맥스 X 설국열차 = 압도적 상상력"
        subTitle.text = "모털 엔진"
        
        showDetail.layer.borderColor = UIColor.lightGray.cgColor
        showDetail.layer.borderWidth = 1
        showDetail.layer.cornerRadius = 3
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func showDetailBtnTap(_ sender: UIButton) {
        MainViewController.singleton.showMovieDetailPage(moviePk: 2)
    }
    
}
