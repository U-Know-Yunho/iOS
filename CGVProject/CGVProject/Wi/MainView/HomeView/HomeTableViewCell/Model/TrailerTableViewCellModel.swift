//
//  TrailerTableViewCellModel.swift
//  CGVProject
//
//  Created by Wi on 09/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

class TrailerTableViewCellModel {
    var youtubeUrl: String
    var titleImageUrl: String
    var title: String
    var subTitle: String
    
    init(trailer: Trailer ) {
        youtubeUrl = trailer.youtubeUrl
        titleImageUrl = trailer.titleImageUrl
        title = trailer.title
        subTitle = trailer.subTitle
    }
    
}
