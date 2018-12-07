//
//  Data.swift
//  CGVProject
//
//  Created by PigFactory on 03/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct info {
    var pk : Int
    var title: String
    var director: String
    var cast: [String] //"질 를르슈, 마리아 발베르드"
    var duration_min: Int
    var opening_date: String //"2018-11-29"
    var genre: String
    var description: String
    var trailer: String
    var reservation_score: Double
    var now_show: Bool
    var main_img_url: String
    var stillcuts: Stillcuts
        
    struct Stillcuts {
        var movie: Int
        var image_url: String
    }
}
