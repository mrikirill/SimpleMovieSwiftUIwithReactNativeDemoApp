//
//  MovieListItem.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import SwiftUI

struct MovieListItem: View {
    var movie: MovieItem
    
    var body: some View {
        HStack {
            MovieImage(path: movie.posterPath)
            VStack(alignment: .leading) {
                Text(movie.title)
                Text("Popularity: \(movie.popularity)").font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}
