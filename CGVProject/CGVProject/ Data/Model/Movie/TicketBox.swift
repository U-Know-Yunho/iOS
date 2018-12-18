//
//  TicketBox.swift
//  CGVProject
//
//  Created by PigFactory on 18/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct TicketBox: Codable {
    
    let detail: Detail?
    let movie: [Movie]?
    let location: [Location]?
    let subLocation: [SubLocation]?
    let date: [[Date]]?

    struct Detail: Codable {
        let pk: Int?
        let title: String?
        let age: String?
        let durationMin: Int?
    }
    
    struct Movie: Codable {
        let pk: Int?
        let title: String?
        let thumbImgUrl: String?
    }

    struct Location: Codable {
        let pk: Int?
        let location: String?
        let num: Int?
    }

    struct Date: Codable {
        let date: String?
        let weekday: String?
        let show: Bool
    }

    struct SubLocation: Codable {
        let subLocation: String?
        let screenTime: [ScreenTime]?
    }

    struct ScreenTime: Codable {
        let pk: Int?
        let auditoriumName: String?
        let times: String?
        let currentSeatsNo: Int?
    }
    
}
