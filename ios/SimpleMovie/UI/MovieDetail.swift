//
//  MovieDetail.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import SwiftUI

struct MovieDetail: View {
    let movieTitle: String
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.movieList) { movie in
                VStack {
                    MovieImage(path: movie.posterPath, width: 250)
                }
                
                VStack {
                    Text(movie.overview)
                }
                
                HStack{
                    Text("ID: ")
                    Text("\(movie.id)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Original title: ")
                    Text("\(movie.originalTitle)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Original language: ")
                    Text("\(movie.originalLanguage)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Votes: ")
                    Text("\(movie.voteCount)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Popularity: ")
                    Text("\(movie.popularity)").font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .onAppear() {
            viewModel.fetchMovieDetail()
        }
        .navigationTitle(movieTitle)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movieTitle: "", viewModel: .init(movieId: 1))
    }
}
