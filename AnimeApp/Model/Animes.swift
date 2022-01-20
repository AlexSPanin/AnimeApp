//
//  Anime.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import Foundation

struct Animes: Decodable {
    let data: Attributes?
    
    init(data: Attributes) {
        self.data = data
    }
    
    init(animesData: [String: Any]) {
        data = animesData["data"] as? Attributes
    }
    
    static func getAnimes(from value: Any) -> Animes {
        var animes = Animes(animesData: [:])
        
        guard let animesData = value as? [String: Any] else { return animes}
        
        for (key, value) in animesData {
            if key == "data" {
                animes = Animes(data: Attributes.getAnimeData(from: value))
            }
        }
        return animes
    }
}

struct Attributes: Decodable {
    let attributes: [Attribute]?
    
    init(attributes: [Attribute]) {
        self.attributes = attributes
    }
    
    static func getAnimeData(from value: Any) -> Attributes {
        guard let animesData = value as? [[String: Any]] else { return Attributes(attributes: []) }
        
        var attributes = [Attribute]()
        
        for animeData in animesData {
            for (key, value) in animeData {
                if key == "attributes" {
                    let anime = Attribute.getAttributes(from: value)
                    attributes.append(anime)}
            }
        }
        return Attributes(attributes: attributes)
    }
}

struct Attribute: Decodable {
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
    
    init(attributesData: [String: Any]) {
        slug = attributesData["slug"] as? String
        synopsis = attributesData["synopsis"]  as? String
        userCount = attributesData["useCount"] as? Int
        favoritesCount = attributesData["favoriteCount"] as? Int
        posterImage = PosterImage.getPosterImage(from: attributesData["posterImage"] ?? [:])
    }
    
    static func getAttributes(from value: Any) -> Attribute {
        guard let attributesData = value as? [String: Any] else { return Attribute(attributesData: [:])}
        return Attribute(attributesData: attributesData)
    }
}

struct PosterImage: Decodable {
    let tiny: String?
    let original: String?
    
    init(posterImage: [String: Any]) {
        tiny = posterImage["tiny"] as? String
        original = posterImage["original"] as? String
    }
    
    static func getPosterImage(from value: Any) -> PosterImage {
        guard let posterData = value as? [String: Any] else { return PosterImage(posterImage: [:]) }
        return PosterImage(posterImage: posterData)
    }
}
