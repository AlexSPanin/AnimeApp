//
//  Anime.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import Foundation

struct Anime: Decodable {
    let data: [Data]?
}

struct Data: Decodable {
    let attributes: Attributes?
    
}

struct Attributes: Decodable {
    let slug: String?
    let synopsis: String?
    let userCount: Int
    let favoritesCount: Int
    let posterImage: PosterImage?
}

struct PosterImage: Decodable {
    let original: String?
}
