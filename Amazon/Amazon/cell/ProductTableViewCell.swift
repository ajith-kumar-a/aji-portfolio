//
//  ProductTableViewCell.swift
//  Amazon
//
//  Created by Apple on 17/07/23.
//

import UIKit

typealias SeeAllClosure = ((_ index : Int?) -> Void)
typealias DidSelectClosure = ((_ tableindex : Int?,_ collectionIndex : Int?) -> Void)

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var catagoryName: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var index : Int?
    var onClickAllClosure : SeeAllClosure?
    var didSelectAllClosure : DidSelectClosure?
    
    var productDetails : ProductDetails?{
        
        didSet{
            catagoryName.text = productDetails?.categoryName
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    @IBAction func onClickSeeAll(_ sender: Any) {
        onClickAllClosure?(index)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ProductTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productDetails?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        cell.productData.text = productDetails?.products?[indexPath.row].name
        cell.img.image = UIImage(named: productDetails?.products?[indexPath.row].imageName ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectAllClosure?(index,indexPath.row)
        
    }
    
    
}
