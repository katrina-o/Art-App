//
//  DetailViewController.swift
//  Art App
//
//  Created by Екатерина Орлова on 28.01.2025.
//

import Foundation
import UIKit
import SnapKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    
    var artistImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "0")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Pablo Picasso"
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Author"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Biography"
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthoAuthorAuthorAuthorAuthorAuthorAuthorAutho"
        return label
    }()
    
    let worksLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Works"
        return label
    }()
    
    var worksTableView: UITableView = {
        let tableView = UITableView()
        tableView.autoresizingMask = .flexibleHeight
        tableView.autoresizingMask = .flexibleWidth
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
        createTable()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(artistImage)
        artistImage.backgroundColor = .black
        artistImage.addSubview(nameLabel)
        artistImage.addSubview(authorLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(bioLabel)
        view.addSubview(worksLabel)
        view.addSubview(worksTableView)
        worksTableView.backgroundColor = .red
    }
    
    func createTable() {
        self.worksTableView = UITableView(frame: view.bounds, style: .plain)
        worksTableView.register(WorksCell.self, forCellReuseIdentifier: WorksCell.identifire)
       
        self.worksTableView.delegate = self
        self.worksTableView.dataSource = self
        
        worksTableView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
        
        DispatchQueue.main.async {
            self.worksTableView.reloadData()
        }
    }
    
    private func makeConstraints() {
        artistImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(364)
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(artistImage.snp.leading).inset(26)
            make.bottom.equalTo(artistImage.snp.bottom).inset(30)
//            make.height.equalTo(24)
        }

        authorLabel.snp.makeConstraints { make in
            make.leading.equalTo(artistImage.snp.leading).inset(26)
            make.bottom.equalTo(artistImage.snp.bottom).offset(-5)
//            make.height.equalTo(24)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(artistImage.snp.bottom).inset(40)
            make.leading.equalTo(view.snp.leading).inset(26)
            make.bottom.equalTo(bioLabel.snp.top).offset(-15)
        }

        bioLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(26)
            make.bottom.equalTo(worksLabel.snp.top).offset(-20)
        }

        worksLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(26)
            make.bottom.equalTo(worksTableView.snp.top).offset(-20)
        }

        worksTableView.snp.makeConstraints { make in
            make.top.equalTo(worksLabel.snp.bottom).offset(10) // Раскомментировано
            make.leading.trailing.equalToSuperview().inset(26)
            make.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
    }
}
