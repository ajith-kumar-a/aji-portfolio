//
//  BottomCollectionViewCell.swift
//  Task1
//
//  Created by Apple on 20/07/23.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    func setUpBottom(_ item : ListItem)
    {
        cellImageView.image = UIImage(named: item.image)
        cellTitleLabel.text = item.title
           

        cellImageView.layer.cornerRadius = cellImageView.frame.height / 4

    }
    
}
