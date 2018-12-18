//
//  APIEnum.swift
//  CGVProject
//
//  Created by Wi on 03/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation


enum API{
    static let baseURL = "https://www.younghoonjean.com/api/"
    //데이터 오는거 보고 추가
    enum MovieURL {
        static let movieList = API.baseURL + "movies/"
        static let movieDetail = API.baseURL + "movies/detail/"
        static let homeViewData =  "https://www.younghoonjean.com/m/?now_open="
<<<<<<< HEAD
<<<<<<< HEAD
        static let mobileMovieList = API.baseURL + "tickets/m/movies/"
=======
        static let MovieOfficialList = API.baseURL + "movies/official/"
>>>>>>> 23da972285e0c41ca1e605419bd2cf0907d722d6
=======
        static let MovieOfficialList = API.baseURL + "movies/official/"
        static let mobileMovieList = API.baseURL + "tickets/m/movies/"
>>>>>>> temp77
    }
    enum AuthURL {
        static let signUp = API.baseURL + "members/signup/"
        static let checkID = API.baseURL + "members/checkID/"
        static let signIn = API.baseURL + "members/login/"
        static let socialSignIn = API.baseURL + "members/social-login/"
        static let signOut = API.baseURL + "members/logout/"
        static let checkPW = API.baseURL + "members/check-password/"
    }
    enum UserURL {
        static let userProfile = API.baseURL + "members/profile/"
        static let userDelete = API.baseURL + "members/user-delete/"
        
    }
    
    enum TheaterURL {
        static let theaterList = API.baseURL + "theaters/list"
        static let theaterDetail = API.baseURL + "theaters/detail/"
        static let ticketBoxList = API.baseURL + "tickets/m/filter/"
    }
}
