//
//  WorksCell.swift
//  Art App
//
//  Created by Екатерина Орлова on 31.01.2025.
//

import Foundation
import UIKit
import SnapKit

class WorksCell: UITableViewCell {
    
    static let identifire = "CustomCell"
    
    var worksImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.image = UIImage(named: "0")
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with image: UIImage,  title: String) {
        self.worksImage.image = image
        self.titleLabel.text = title
    }
    
    func setupUI () {
        contentView.addSubview(worksImage)
        contentView.addSubview(titleLabel)
        
        worksImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
            make.leading.equalTo(contentView).inset(10)
            make.trailing.equalTo(contentView).inset(10)
            make.width.equalTo(336)
            make.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(worksImage.snp.bottom).inset(10)
            make.leading.equalTo(contentView.snp.leading).offset(10)
        }
    }
}
