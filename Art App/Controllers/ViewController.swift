//
//  ViewController.swift
//  Art App
//
//  Created by Катя on 17.09.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var artistManger = ArtistManager()
    var artistCell = ArtistCell()
   
    
    var artistsTableView: UITableView = {
        let tableView = UITableView()
        tableView.autoresizingMask = .flexibleHeight
        tableView.autoresizingMask = .flexibleWidth
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistManger.fetchData()
        createTable()
    }

    func createTable() {
        self.artistsTableView = UITableView(frame: view.bounds, style: .plain)
        artistsTableView.register(ArtistCell.self, forCellReuseIdentifier: ArtistCell.identifire)
       
        self.artistsTableView.delegate = self
        self.artistsTableView.dataSource = self
        
        artistsTableView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
        view.addSubview(artistsTableView)
        
        DispatchQueue.main.async {
            self.artistsTableView.reloadData()
        }
    }
    //MARK: UITableViewDataSourse
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artistManger.artist.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistCell.identifire, for: indexPath) as? ArtistCell else {
            fatalError("The TableView could not dequeue a ArtistCell in ViewController")
        }
        let indexpathArtist = artistManger.artist.artists[indexPath.row]
        cell.configure(with: UIImage(imageLiteralResourceName: indexpathArtist.image), nameLabel: indexpathArtist.name, and: indexpathArtist.bio)
        
        return cell
    }
    
    //MARK: UITableViewDelegate
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 170.0
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        let indexPathWorks = artistManger.artist.artists[indexPath.row].works
        print(indexPathWorks)
    }
}

