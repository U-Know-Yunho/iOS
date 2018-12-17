//
//  TheaterModel.swift
//  CGVProject
//
//  Created by PigFactory on 17/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

//데이터 처리 #1
class TheaterModel {
    var location: String?
    var auditorium: String?
    var all_seats_no: Int?
    var current_seats_no: Int?
    var time: [TheaterDetail.CurrentMovies]
    var time2: [TheaterDetail.Screenings]
    //    var time3: [TheaterDetail.Screenings.Auditorium.Screening_times]
    var time4: String?
    
    //데이터 처리 #1
    init(_ theaterDetail: TheaterDetail) {
        location = theaterDetail.location
        time = theaterDetail.current_movies!
        time2 = theaterDetail.screenings!
        time4 = theaterDetail.screenings![0].auditorium![0].screeeing_times![0].time!
    }
    
}
