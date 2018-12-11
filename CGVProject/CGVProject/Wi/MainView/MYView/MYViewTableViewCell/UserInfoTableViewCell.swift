//
//  UserInfoTableViewCell.swift
//  CGVProject
//
//  Created by Wi on 29/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var userID: UILabel!
    
    var model: User?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
        setUserInfo()
    }
    
    func setProfile(){
        guard let user = model else {return}
        self.userID.text = user.username
        
    }
    func setUserInfo() {
        KOSessionTask.userMeTask { [weak self] (error, userMe) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            guard let me = userMe,
                let nickname = me.nickname,
                let thumbnailImageLink = me.thumbnailImageURL else { self?.setProfile(); return }
            print(me)
            
            self?.userNickName.text = nickname
            
            let imageLinks = [thumbnailImageLink]
            for url in imageLinks {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let error = error {
                        return print(error.localizedDescription)
                        
                    }
                    guard let data = data, let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        if url == thumbnailImageLink {
                            self?.userProfileImageView.image = image
                        }
                    }
                    
                }).resume()
            }
            
        }
    }
    
    

    func configure(){
        // MARK: userProfileImageView
        
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.width / 2
        userProfileImageView.layer.masksToBounds = true
        // MARK: userID
        userIDEncryption()
    }
    func userIDEncryption(){
        guard var id = userID.text else {return}
        id.remove(at: String.Index(encodedOffset: 2))
        id.append(Character("*"))
        userID.text = id
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
