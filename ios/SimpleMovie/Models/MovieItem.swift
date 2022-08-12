//
//  MovieItem.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import Foundation

struct MovieItem: Identifiable, Codable {
    let posterPath: String
    let adult: Bool
    let overview: String
    let releaseDate: String
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let voteCount: Int
    let popularity: Float
}
