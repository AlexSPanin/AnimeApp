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
        tableView.rowHeight = 256
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
}

// MARK: - Networking

extension AnimeTableViewController {
    func fetchAnimes(_ sender: String) {
        guard let url = URL(string: sender) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Error Data")
                return
            }
            do {
                let anime = try JSONDecoder().decode(Animes.self, from: data)
                self.animes = anime
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
