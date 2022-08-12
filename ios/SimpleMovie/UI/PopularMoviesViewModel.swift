//
//  PopularMoviesViewModel.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import Foundation
import Combine

extension PopularMovies {
    class ViewModel: ObservableObject {
        @Published private(set) var state = State()
 
        struct State {
               var movies: [MovieItem] = []
               var page: Int = 1
               var canLoadNextPage = true
        }
        
        private var service: MoviesService
        
        init() {
            self.service = MoviesService()
            fetchNextPageIfPossible()
        }
        
        func fetchNextPageIfPossible() {
            guard state.canLoadNextPage else { return }
            print("Page: \(state.page)");
            
            Task {
                let result = await service.getPopularMovies(page: state.page)
                DispatchQueue.main.async {
                    switch result {
                        case .success(let res):
                            self.state.page += 1
                            self.state.movies += res.results
                            self.state.canLoadNextPage = self.state.page < res.totalPages
                        case .failure(let error):
                            self.state.canLoadNextPage = false
                            print(error.customMessage)
                    }
                }
            }
        }
    }
}
