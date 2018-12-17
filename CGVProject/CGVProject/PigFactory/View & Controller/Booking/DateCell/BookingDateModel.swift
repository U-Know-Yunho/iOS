//
//  BookingDateModel.swift
//  CGVProject
//
//  Created by PigFactory on 17/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

//데이터 처리 #1
class BookingDateModel {
    var day: String
    var date: String
    
    init(_ movie: Movie) {
        day = movie.mainImgUrl
        date = movie.mainImgUrl
    }
}
