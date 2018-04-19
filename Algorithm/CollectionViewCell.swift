//
//  CollectionViewCell.swift
//  Algorithm
//
//  Created by 野見山陸 on 2018/04/16.
//  Copyright © 2018年 野見山陸. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var imgview: UIImageView!
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    
}
