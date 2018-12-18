//
//  TicketBox.swift
//  CGVProject
//
//  Created by PigFactory on 18/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct TicketBox: Decodable {
    
    let detail: Detail?
    let movie: [Movie?]
    let location: [Location?]
    let subLocation: [SubLocation?]
    
    struct Detail: Decodable {
        let pk: Int?
        let title: String?
        let age: String?
        let durationMin: Int?
    }
    
    struct Movie: Decodable {
        let pk: Int?
        let title: String?
        let thumbImgUrl: String?
    }
    
    struct Location: Decodable {
        let pk: Int?
        let location: String?
        let num: Int
    }
    
    struct SubLocation: Decodable {
        let subLocation: String?
        let screenTime: [ScreenTime?]
        let date: [Date?]
        
        struct ScreenTime: Decodable {
            let pk: Int?
            let auditoriumName: String?
            let times: String?
            let currentSeatsNo: Int?
        }
        
        struct Date: Decodable {
            struct D1: Decodable {
                let date: String?
                let weekday: String?
            }
            struct D2: Decodable {
                let show: Bool
            }
        }
    }
    
}
