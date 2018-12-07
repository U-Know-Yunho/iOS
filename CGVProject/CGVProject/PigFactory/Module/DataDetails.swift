//
//  DataDetails.swift
//  CGVProject
//
//  Created by PigFactory on 03/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct info2 {
    var aaa: [aaaDetails]
    
    struct aaaDetails {
        var pk: Int
        var title: String
        var reservation_score: Double
        var main_img_url: String
        var now_show: Bool
        var opening_date: String //"2018-11-29"
    }
}
