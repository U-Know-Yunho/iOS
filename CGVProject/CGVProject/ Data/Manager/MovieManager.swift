//
//  MovieManager.swift
//  CGVProject
//
//  Created by Wi on 03/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation
import Alamofire

class MovieManager {
    // MARK: Singleton 사용시 MovieManager.singleton.함수명으로 사용해주세요
    static let singleton = MovieManager()
    
    // nowOpen에 따라 현재 상영작과 개봉 예정작을 판별해 데이터를 로드합니다.
    func loadHomeViewData(nowOpen: Bool, completion: @escaping (HomeViewData) -> Void){
        let header: HTTPHeaders = [ "Content-Type": "application/json"]
        let pram: Parameters = [
            "nowOpen": nowOpen
        ]

        Alamofire.request(API.MovieURL.homeViewData + "\(nowOpen)", method: .get, parameters: pram, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseData { (response) in
                switch response.result{
                case .success(let data):
                    do{
                        let movies = try JSONDecoder().decode(HomeViewData.self, from: data)
                        print(movies)
                        completion(movies)
                    }catch{
                        print("HomeData Decode err: ",error.localizedDescription)
                    }
                    
                case .failure(let err):
                    print("HomeData Err:",err.localizedDescription)
                }
        }
        
    }
    
    // MARK: 전체 무비 리스트를 가져오는 함수 입니다.
    func loadMovieList(completion: @escaping ([HomeViewData.Movie]) -> Void){
        
        Alamofire.request(API.MovieURL.movieList, method: .get).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let movies = try JSONDecoder().decode([HomeViewData.Movie].self, from: data)
                    completion(movies)
                }catch{
                    print(error.localizedDescription, "eerr")
                }
            case .failure(let err):
                print("movieList Err: ",err.localizedDescription)
            }
        }
    }
   
    // pk 입력시  pk에 맞는 영화 상세정보 불러오는 함수입니다.
    func loadMovieDetail(_ pk: Int, completion: @escaping ((MovieDetail)-> Void)){
        //임시 api 임 작동 안함
        Alamofire.request(API.MovieURL.movieDetail + "\(pk)/", method: .get).responseData { (response) in
            switch response.result{
            case .success(let data):
                print("loadMovieDetail")
                do{
                    let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                    completion(movieDetail)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}
