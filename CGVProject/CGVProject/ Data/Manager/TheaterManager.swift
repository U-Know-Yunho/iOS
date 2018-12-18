//
//  TheaterManager.swift
//  CGVProject
//
//  Created by PigFactory on 16/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation
import Alamofire

class TheaterManager {
    static let singleton = TheaterManager()

    func loadTheaterList(completion: @escaping ([Theater]) -> Void){
        Alamofire.request(API.TheaterURL.theaterList, method: .get).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let theaters = try JSONDecoder().decode([Theater].self, from: data)
                    completion(theaters)
                }catch{
                    print(error.localizedDescription, "eerr")
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func loadTheaterDetail(_ pk: Int, completion: @escaping ((TheaterDetail)-> Void)){
        Alamofire.request(API.TheaterURL.theaterDetail + "\(pk)/", method: .get).responseData { (response) in
            switch response.result{
            case .success(let data):
                print("loadMovieDetail")
                do{
                    let theaterDetail = try JSONDecoder().decode(TheaterDetail.self, from: data)
                    completion(theaterDetail)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func loadTicketBoxList(_ pk: Int, completion: @escaping ((TicketBox)-> Void)){
        Alamofire.request(API.TheaterURL.ticketBoxList + "\(pk)/", method: .get).responseData { (response) in
            switch response.result{
            case .success(let data):
                print("ticketPoxList")
                do{
                    let ticketBoxList = try JSONDecoder().decode(TicketBox.self, from: data)
                    completion(ticketBoxList)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
