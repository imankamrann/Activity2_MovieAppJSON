//
//  MovieListView.swift
//  Activity1_MovieApp
//
//  Created by Iman on 2025-01-10.
//

//import SwiftUI
//struct MovieListView: View {
//    @StateObject private var viewModel = MovieListViewModel()
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.movies) { movie in
//                NavigationLink(destination: MovieDetailView(movie: movie)) {
//                    MovieRowView(movie: movie)
//                }
//            }
//            .navigationTitle("Movies")
//        }
//    }
//}

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieRowView(movie: movie)
                }
            }
            .navigationTitle("Movies")
            .toolbar { // Add a navigation button to the toolbar
                NavigationLink(destination: ProfileView()) {
                    Text("Profile")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
