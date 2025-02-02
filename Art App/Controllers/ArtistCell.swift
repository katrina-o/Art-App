//
//  ArtistCell.swift
//  Art App
//
//  Created by Катя on 22.09.2024.
//

import UIKit
import SnapKit

class ArtistCell: UITableViewCell {
    
    static let identifire = "CustomCell"
    
    var artistImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.image = UIImage(named: "0")
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with image: UIImage,  nameLabel: String, and bioLabel: String) {
        self.artistImage.image = image
        self.nameLabel.text = nameLabel
        self.bioLabel.text = bioLabel
    }
    
    func setupUI () {
        contentView.addSubview(artistImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(bioLabel)
        
        artistImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
            make.leading.equalTo(contentView).inset(10)
            make.width.equalTo(96)
            make.height.equalTo(96)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(artistImage.snp.top).inset(10)
            make.leading.equalTo(artistImage.snp.trailing).offset(15)
            make.trailing.equalTo(contentView).inset(20)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(artistImage.snp.trailing).offset(15)
            make.trailing.equalTo(contentView.snp.trailing).inset(20)
        }
    }
}
