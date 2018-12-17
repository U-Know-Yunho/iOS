//
//  Seat.swift
//  CGVProject
//
//  Created by PigFactory on 17/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct Seat: Decodable{
    let pk: Int?
    let row: Int?  //행
    let number: Int?   //열
    let reservationCheck: Bool?
}
