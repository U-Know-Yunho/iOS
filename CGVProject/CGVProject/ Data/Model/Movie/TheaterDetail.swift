//
//  TheaterDetail.swift
//  CGVProject
//
//  Created by PigFactory on 16/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct TheaterDetail: Decodable{
    let location: String?
    let sub_location: String?
    let address: String?
    let current_movies: [CurrentMovies]?
    let all_auditoriums_no: Int?
    let all_seats_no: Int?
    let screenings: [Screenings]?
    
    struct CurrentMovies: Decodable {
        let title: String?
        let now_show: Bool?
        let genre: String?
        let duration_min: Int?
        let opening_date: String?
        let main_img_url: String?
    }
    
    struct Screenings: Decodable {
        let auditorium: [Auditorium]?
        
        struct Auditorium: Decodable {
            let name: String?
            let seats_no: Int?
            let screeeing_times: [Screening_times]?
            
            struct Screening_times: Decodable {
                let time: String?
                let current_seats_no: Int?
            }
        }
    }
}
