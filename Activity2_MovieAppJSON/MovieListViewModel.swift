//
//  MovieListViewModel.swift
//  Activity2_MovieAppJSON
//
//  Created by Iman on 2025-01-10.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    init() {
        fetchMovies()
    }
    private func fetchMovies() {
        movies = JSONLoader.loadMovies(from: "movies")
    }
}
