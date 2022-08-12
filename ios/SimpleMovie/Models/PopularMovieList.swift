//
//  MoviePopular.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import Foundation

struct PopularMovieList: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [MovieItem]
}
