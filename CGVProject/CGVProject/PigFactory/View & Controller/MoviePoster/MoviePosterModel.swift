//
//  MoviePostrModel.swift
//  CGVProject
//
//  Created by PigFactory on 08/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

//데이터 처리 #1 - Movie class에 저장된 url img 주소를 생성한 변수에 넣어준다.
class MoviePosterCollectionViewCellModel {
    var moviePosterImageUrl: String
    
    init(_ movie: Movie) {
        moviePosterImageUrl = movie.mainImgUrl
    }
}
