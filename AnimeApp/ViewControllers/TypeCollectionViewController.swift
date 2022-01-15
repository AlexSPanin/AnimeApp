//
//  TypeCollectionViewController.swift
//  AnimeApp
//
//  Created by Александр Панин on 15.01.2022.
//

import UIKit

enum LinkView: String {
    case tokyoViewURL = "https://picfiles.alphacoders.com/173/thumb-1920-173749.png"
    case adventureViewsURL = "https://static.zerochan.net/Eight.Generals.full.1549619.jpg"
    case chihiroViewURL = "https://i.pinimg.com/736x/e6/27/ba/e627ba6bcbd92378304b8c99c49b23fe.jpg"
    case pokemonViewURL = "https://www.thequiz.com/wordpress/wp-content/uploads/2017/05/landscape-1456482902-pokemon.jpg"
    case pikachuViewURL = "https://i.pinimg.com/736x/ec/d6/19/ecd61981c067f0710844ab6774dd76e2.jpg"
    case godzillaViewURL = "https://i.pinimg.com/736x/0a/ec/d0/0aecd09efcb71b4d2514037c18d421af--kaiju-godzilla-artwork.jpg"
}

enum Link: String {
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

private let reuseIdentifier = "Cell"

class TypeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
