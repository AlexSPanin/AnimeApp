//
//  AnimeTableViewController.swift
//  AnimeApp
//
//  Created by Александр Панин on 15.01.2022.
//

import UIKit

class AnimeTableViewController: UITableViewController {
    
    private var animes: Animes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 64
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animes?.data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnimeTableViewCell
        
        let anime = animes?.data?[indexPath.row]
        
        cell.configure(animes: anime)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let anime = animes?.data?[indexPath.row] else { return }
       
        let detailsVC = segue.destination as! DetailsViewController
        detailsVC.anime = anime
    }
}

// MARK: - Networking

extension AnimeTableViewController {
    func fetchAnimes(_ sender: String) {
    
        NetworkingManager.shared.fetchData(url: sender) { result in
            switch result {
                
            case .success(let data):
                self.animes = data
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
