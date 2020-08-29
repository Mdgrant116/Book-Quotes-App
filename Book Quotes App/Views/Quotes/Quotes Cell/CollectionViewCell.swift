//
//  CollectionViewCell.swift
//  Book Quotes App
//
//  Created by Michael Grant on 8/28/20.
//  Copyright © 2020 Michael Grant. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet var cellView: UIView!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        
    }
    
}
