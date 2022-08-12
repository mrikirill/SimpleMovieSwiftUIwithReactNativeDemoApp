//
//  MovieService.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import Foundation

protocol IMoviesService {
    func getPopularMovies(page: Int) async -> Result<PopularMovieList, RequestError>
    func getMovieDetail(id: Int) async -> Result<MovieItem, RequestError>
}

struct MoviesService: ApiRepository, IMoviesService {
    func getPopularMovies(page: Int = 1) async -> Result<PopularMovieList, RequestError> {
        return await sendRequest(endpoint: ApiEndpoints.moviePopular(page: page), responseModel: PopularMovieList.self)
    }
    
    func getMovieDetail(id: Int) async -> Result<MovieItem, RequestError> {
        return await sendRequest(endpoint: ApiEndpoints.movieDetail(id: id), responseModel: MovieItem.self)
    }
}
