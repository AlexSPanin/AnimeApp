//
//  AnimeTableViewCell.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import UIKit

class AnimeTableViewCell: UITableViewCell {
    
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var UserCountLabel: UILabel!
    @IBOutlet var FavoriteCountLabel: UILabel!
    @IBOutlet var DescriptionLabel: UILabel!
    @IBOutlet var AnimeImage: UIImageView!
    
    func configure(animes: Anime?) {
        guard let anime = animes?.attributes else { return }
        
        AnimeImage.layer.cornerRadius = 20
        
        TitleLabel.text = anime.slug ?? ""
        UserCountLabel.text = "Number Users: \(anime.userCount ?? 0)"
        FavoriteCountLabel.text = "Favorite Users: \(anime.favoritesCount ?? 0)"
        DescriptionLabel.text = anime.synopsis ?? ""
        
        DispatchQueue.global().async {
            guard let url = URL(string: anime.posterImage?.tiny ?? "" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.AnimeImage.image = UIImage(data: imageData)
            }
        }
    }
}
