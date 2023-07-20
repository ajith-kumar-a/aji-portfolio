//
//  models.swift
//  Amazon
//
//  Created by Apple on 17/07/23.
//

import Foundation


struct ProductModel : Codable{
   var response : [ProductDetails]?
}

struct ProductDetails : Codable{ 
    var categoryName : String?
    var  products : [ProductDecs]?
}

struct ProductDecs : Codable{
    var  name : String?
    var  imageName : String?
    var  price : String?
    var  description : String?
}
