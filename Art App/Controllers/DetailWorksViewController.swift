//
//  DetailViewController.swift
//  Art App
//
//  Created by Катя on 23.09.2024.
//

import UIKit
import SnapKit

class DetailWorksViewController: UIViewController {
  
    weak var delegate: UITableViewDelegate?
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .right
        return label
    }()
    
    var worksImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "Picasso1")
        
        return image
    }()
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .right
        label.numberOfLines = 0
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
     
    func initialize() {      
        view.backgroundColor = .systemPink
        view.addSubview(worksImage)
    }
    
    
    
    
}
