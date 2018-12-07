//
//  Movie.swift
//  CGVProject
//
//  Created by Wi on 03/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation


struct Movie: Decodable{
    let pk: Int
    let title: String
    let reservationScore: Int
    let mainImgUrl: String
    let nowShow: Bool
    let openingDate: String
    
}
