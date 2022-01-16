//
//  TypeCollectionViewController.swift
//  AnimeApp
//
//  Created by Александр Панин on 15.01.2022.
//

import UIKit


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
        
        cell.typeActionLabel.text = typeAction[indexPath.item].rawValue
        NetworkingManadgerView.shared.fetchImageView(url: url) { image in
            cell.typeActionView.image = image
        }
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

