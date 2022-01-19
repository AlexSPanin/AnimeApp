//
//  AnimeTableViewCell.swift
//  AnimeApp
//
//  Created by Александр Панин on 16.01.2022.
//

import UIKit

class AnimeTableViewCell: UITableViewCell {
    
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var AnimeImage: UIImageView!
    
    func configure(animes: Anime?) {
        guard let anime = animes?.attributes else { return }
                
        TitleLabel.text = anime.title
        
        DispatchQueue.global().async {
            guard let url = URL(string: anime.posterImage?.tiny ?? "" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.AnimeImage.image = UIImage(data: imageData)
            }
        }
    }
}
