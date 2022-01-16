//
//  Anime.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import Foundation

struct Anime: Decodable {
    let slug: String?
    let synopsis: String?
    let tiny: String?
    let large: String?
    let medium: String?
}
