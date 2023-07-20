//
//  MiddleCollectionViewCell.swift
//  Task1
//
//  Created by Apple on 20/07/23.
//

import UIKit

class MiddleCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    @IBOutlet weak var cellTitleLable: UILabel!
    
    func setUpMiddle(_ item : ListItem ){
        cellImageView.image = UIImage(named: item.image)
        cellTitleLable.text = item.title
        
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 4

    }
    
}
