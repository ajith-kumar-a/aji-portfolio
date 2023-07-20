//
//  TopCollectionViewCell.swift
//  Task1
//
//  Created by Apple on 20/07/23.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    func setUpTop(_ item : ListItem){
        cellImageView.image = UIImage(named: item.image)
        cellImageView.layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 4

    }
}
