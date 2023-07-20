//
//  ViewController.swift
//  Amazon
//
//  Created by Apple on 17/07/23.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    var product : ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                loadJson()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
   
    
     func loadJson(){
        
        if let path = Bundle.main.path(forResource: "EcommerceJson", ofType: "json"){
            
            do{
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path),options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data,options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult,options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
               
                product = try jsonDecoder.decode(ProductModel.self, from:jsonData)
            
            }
            catch{
                print("error \(error)")
            }
            
        }
    }
    
    func moveOnProductListing(index:Int){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListingViewController") as? ProductListingViewController
        else {
            return
        }
        vc.productListing = product?.response?[index]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    func moveOnProductDetails(tindex:Int,rindex:Int){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        else {
            return
        }
        vc.productDetails = product?.response?[tindex].products?[rindex]
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
  

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(product?.response?.count as Any)
        return product?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell
        else{
         
           return UITableViewCell()
        }
        cell.productDetails = product?.response?[indexPath.row]
        
        
        cell.index = indexPath.row
        cell.onClickAllClosure = { index in
            if let indexp = index {
                self.moveOnProductListing(index: indexp)
            }
            
        }
        
        cell.didSelectAllClosure = { tabindex , colindex in
            if let tabindexp = tabindex, let colindexp = colindex{
                self.moveOnProductDetails(tindex: tabindexp, rindex: colindexp)
            }
        }
        return cell
    }
    
}
