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

        descriptionLabel.text = anime.attributes?.synopsis ?? ""
    }
}
