//
//  ProductListingViewController.swift
//  Amazon
//
//  Created by Apple on 18/07/23.
//

import UIKit

class ProductListingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productListing : ProductDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = productListing?.categoryName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    

    

}

extension ProductListingViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return productListing?.products?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell
        else {
            return UITableViewCell()
        }
                
        cell.productName.text = productListing?.products?[indexPath.row].name
        
        cell.productPrice.text = productListing?.products?[indexPath.row].price
        
        cell.productDescription.text = productListing?.products?[indexPath.row].description
        
        cell.productImage.image = UIImage(named: productListing?.products?[indexPath.row].imageName ?? "")
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
                else
        {
            return
        }
        vc.productDetails = productListing?.products?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true             )
    }
    
    
    
}
