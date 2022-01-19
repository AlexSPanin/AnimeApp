//
//  Anime.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import Foundation

struct Animes: Decodable {
    let data: [Anime]?
}

struct Anime: Decodable {
    let attributes: Attributes?
    
}

struct Attributes: Decodable {
    let slug: String?
    let synopsis: String?
    let userCount: Int?
    let favoritesCount: Int?
    let posterImage: PosterImage?
    
    var title: String {
        """
Title: \(slug ?? "")
User Count: \(userCount ?? 0)
Favorite User: \(favoritesCount ?? 0)
"""
    }
}

struct PosterImage: Decodable {
    let tiny: String?
    let original: String?
}
