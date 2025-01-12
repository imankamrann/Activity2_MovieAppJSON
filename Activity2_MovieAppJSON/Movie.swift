//
//  Movie.swift
//  Activity1_MovieApp
//
//  Created by Iman on 2025-01-10.
//

import Foundation

struct Movie: Identifiable, Codable {
let id: String
let title: String
let genre: String
let releaseYear: Int
let posterImageName: String
let description: String
}
