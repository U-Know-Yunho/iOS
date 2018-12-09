//
//  MovieCollectionViewCellModel.swift
//  CGVProject
//
//  Created by Wi on 03/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation
class MovieCollectionViewCellModel {
    var moviePk: Int
    var moviePosterImageUrl: String
    var movieName: String
    var movieRank: String
    var advanceRate: String

    init(_ movie: Movie) {
        moviePk = movie.pk
        moviePosterImageUrl = movie.mainImgUrl
        movieName = movie.title
        movieRank = String(movie.pk)
        advanceRate = String(movie.reservationScore)
    }
}
