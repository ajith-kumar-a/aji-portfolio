//
//  ListSection.swift
//  Task1
//
//  Created by Apple on 20/07/23.
//

import Foundation

enum ListSection {
    
    case top([ListItem])
    case middle([ListItem])
    case bottom([ListItem])
    
    var items : [ListItem]{
        switch self{
        case .top(let items),
                .middle(let items),
                .bottom(let items):
            
            return items
        }
    }
    
    var itemCount : Int{
        return items.count
    }
    
    var title : String{
        switch self{
        case .top:
            return "Famous Shows"
        case .middle:
            return "Best Character"
        case .bottom:
            return "New Arrived"
        }
    }
}
