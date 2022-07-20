//
//  Movie.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/20.
//

import Foundation

struct Movie {
    var movieTitle: String
    var movieRelease: String
    var movieOverview: String
    var movieRuntime: Int
    var movieRate: Double
    
    init(title: String, releaseDate: String, runtime: Int, overview: String, rate: Double) {
        movieTitle = title
        movieRelease = releaseDate
        movieOverview = overview
        movieRuntime = runtime
        movieRate = rate
    }
}
