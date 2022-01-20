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
    
    var anime: Attribute!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = anime.slug ?? ""
        descriptionLabel.text = anime.synopsis ?? ""
        
        NetworkingManager.shared.fetchImage(url: anime.posterImage?.original ?? "") { result in
            switch result {
            case .success(let data):
                self.detailImage.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
