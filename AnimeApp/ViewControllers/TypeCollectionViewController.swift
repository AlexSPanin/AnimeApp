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
        
        NetworkingManager.shared.fetchImage(url: url)  { result in
            switch result {
                
            case .success(let data):
                cell.typeActionView.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ colletionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showAnime", sender: indexPath.item )
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? Int else { return }
        let url = linkAction[indexPath].rawValue
        let title = typeAction[indexPath].rawValue
        
        let animeVC = segue.destination as! AnimeTableViewController
        animeVC.fetchAnimes(url)
        animeVC.title = title
    }
}

