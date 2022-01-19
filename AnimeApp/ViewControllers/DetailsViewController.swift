//
//  DetailsViewController.swift
//  AnimeApp
//
//  Created by Александр Панин on 19.01.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var anime: Anime!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = anime.attributes?.slug ?? ""
        descriptionLabel.text = anime.attributes?.synopsis ?? ""
        
        NetworkingManager.shared.fetchImage(url: anime.attributes?.posterImage?.original ?? "") { result in
            switch result {
            case .success(let data):
                self.detailImage.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
