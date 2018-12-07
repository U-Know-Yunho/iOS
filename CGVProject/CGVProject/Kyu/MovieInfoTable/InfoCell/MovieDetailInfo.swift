//
//  MovieInfo.swift
//  LoginView
//
//  Created by Maru on 28/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class MovieDetailInfo {
    var director: String
    var actor: String
    var genre: String
    var openDate: String
    var runningTime: String
    
    init(director: String, actor: String, genre: String, openDate: String, runningTime: String) {
        self.director = director
        self.actor = actor
        self.genre = genre
        self.openDate = openDate
        self.runningTime = runningTime
    }
}
