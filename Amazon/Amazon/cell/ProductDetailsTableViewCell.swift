//
//  ProductDetailsTableViewCell.swift
//  Amazon
//
//  Created by Apple on 18/07/23.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
