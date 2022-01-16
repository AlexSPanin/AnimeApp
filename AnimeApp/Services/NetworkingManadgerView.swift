//
//  NetworkingManadgerView.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import Foundation
import UIKit

class NetworkingManadgerView {
    static var shared = NetworkingManadgerView()
    private init() {}
    
    func fetchImageView(url: String, complition: @escaping(_ image: UIImage) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let _ = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                complition(image)
            }
        }.resume()
    }
}

