//
//  CollectionHeaderReusableView.swift
//  Task1
//
//  Created by Apple on 20/07/23.
//

import UIKit

class CollectionHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    func setUpTitle(_ title : String){
        cellTitleLabel.text  = title
    }
    
}
