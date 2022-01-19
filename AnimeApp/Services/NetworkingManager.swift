//
//  NetworkingManadgerView.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import Foundation

enum LinkView: String, CaseIterable {
    case tokyoViewURL = "https://picfiles.alphacoders.com/173/thumb-1920-173749.png"
    case adventureViewsURL = "https://static.zerochan.net/Eight.Generals.full.1549619.jpg"
    case chihiroViewURL = "https://i.pinimg.com/736x/e6/27/ba/e627ba6bcbd92378304b8c99c49b23fe.jpg"
    case pokemonViewURL = "https://www.thequiz.com/wordpress/wp-content/uploads/2017/05/landscape-1456482902-pokemon.jpg"
    case pikachuViewURL = "https://i.pinimg.com/736x/ec/d6/19/ecd61981c067f0710844ab6774dd76e2.jpg"
    case godzillaViewURL = "https://i.pinimg.com/736x/0a/ec/d0/0aecd09efcb71b4d2514037c18d421af--kaiju-godzilla-artwork.jpg"
}

enum Link: String, CaseIterable {
    case tokyoURL = "https://kitsu.io/api/edge/anime?filter[text]=tokyo"
    case adventuresURL = "https://kitsu.io/api/edge/anime?filter[text]=adventures"
    case chihiroURL = "https://kitsu.io/api/edge/anime?filter[text]=chihiro"
    case pokemonURL = "https://kitsu.io/api/edge/anime?filter[text]=pokemon"
    case pikachuURL = "https://kitsu.io/api/edge/anime?filter[text]=pikachu"
    case godzillaURL = "https://kitsu.io/api/edge/anime?filter[text]=godzilla"
}

enum TypeAction: String, CaseIterable {
    case tokyo = "Tokyo"
    case adventures = "Adventures"
    case chihiro = "Chihiro"
    case pokemon = "Pokemon"
    case pikachu = "Pikachu"
    case godzilla = "Godzilla"
}

enum ErrorNetwork: Error {
    case errorURL
    case errorData
    case errorDecoding
}


class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}
    
    func fetchImage(url: String?, complition: @escaping(Result<Data, ErrorNetwork>) -> Void) {
        
        guard let url = URL(string: url ?? "") else {
            complition(.failure(.errorURL))
            return
        }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                complition(.failure(.errorData))
                return
            }
            DispatchQueue.main.async {
                complition(.success(imageData))
            }
        }
    }
    
    func fetchData(url: String?, complition: @escaping(Result<Animes, ErrorNetwork>) -> Void) {
        
        guard let url = URL(string: url ?? "") else {
            complition(.failure(.errorURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complition(.failure(.errorData))
                return
            }
            do {
                let anime = try JSONDecoder().decode(Animes.self, from: data)
                DispatchQueue.main.async {
                    complition(.success(anime))
                }
            } catch {
                complition(.failure(.errorDecoding))
            }
        }.resume()
    }
}

