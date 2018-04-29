//
//  StageCell.swift
//  Algorithm
//
//  Created by 野見山陸 on 2018/04/29.
//  Copyright © 2018年 野見山陸. All rights reserved.
//

import UIKit
import Hero

class StageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var useShortDescription: Bool = true
    
    var stage: StageEasy? {
        didSet {
            guard let stage = stage else { return }
            let name = stage.name
            
            hero.id = "\(name)"
            
            nameLabel.text = name
            imageView.image = stage.image
            descriptionLabel.text = useShortDescription ? stage.shortDescription : stage.description
        }
    }
}
