//
//  ProductDetailsViewController.swift
//  Amazon
//
//  Created by Apple on 18/07/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productDetails : ProductDecs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = productDetails?.name
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    
}

extension ProductDetailsViewController : UITableViewDelegate,UITableViewDataSource {
    
   
    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.productName.text = productDetails?.name
        cell.productPrice.text = productDetails?.price
        cell.productDescription.text = productDetails?.description
      cell.productImage.image = UIImage(named: productDetails?.imageName ?? "")
        
        return cell
    }
    
    
    
}
