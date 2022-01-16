//
//  TypeCollectionViewController.swift
//  AnimeApp
//
//  Created by Александр Панин on 15.01.2022.
//

import UIKit

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

class TypeCollectionViewController: UICollectionViewController {
    
    private let typeAction = TypeAction.allCases
    private let linkViewAction = LinkView.allCases
    private let linkAction = Link.allCases
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        typeAction.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewAnime", for: indexPath) as! TypeAnimeCell
        let url = linkViewAction[indexPath.item].rawValue
        
        NetworkingManadgerView.shared.fetchImageView(url: url) { image in
            cell.typeActionView.image = image
        }
        
        cell.typeActionLabel.text = typeAction[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ colletionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = linkAction[indexPath.item].rawValue
        performSegue(withIdentifier: "showAnime", sender: url)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let animeVC = segue.destination as! AnimeTableViewController
        guard let url = sender as? String else { return }
        animeVC.fetchAnimes(url)
    }
}

// MARK - Private Metod

//extension TypeCollectionViewController {
//
//    private func successAlert() {
//        DispatchQueue.main.async {
//            let alert = UIAlertController(
//                title: "Success",
//                message: "You can see the results in the Debug aria",
//                preferredStyle: .alert
//            )
//
//            let okAction = UIAlertAction(title: "OK", style: .default)
//            alert.addAction(okAction)
//            self.present(alert, animated: true)
//        }
//    }
//
//    private func failedAlert() {
//        DispatchQueue.main.async {
//            let alert = UIAlertController(
//                title: "Failed",
//                message: "You can see error in the Debug aria",
//                preferredStyle: .alert
//            )
//
//            let okAction = UIAlertAction(title: "OK", style: .default)
//            alert.addAction(okAction)
//            self.present(alert, animated: true)
//        }
//    }
//}
//
