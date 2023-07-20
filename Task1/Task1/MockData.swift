//
//  MockData.swift
//  Task1
//
//  Created by Apple on 20/07/23.
//

import Foundation

struct MockData {
    
    static let shared = MockData()

    private let top : ListSection = {
        .top([.init(title: " ", image: "popular-1"),
              .init(title: " ", image: "popular-2"),
              .init(title: " ", image: "popular-3"),
              .init(title: " ", image: "popular-4"),
              .init(title: " ", image: "popular-5"),])
    }()
    
    private let middle : ListSection = {
        .middle([.init(title: "Naruto", image: "profile-1"),
                 .init(title: "Naruto", image: "profile-2"),
                 .init(title: "Naruto", image: "profile-3"),
                 .init(title: "Naruto", image: "profile-4"),
                 .init(title: "Naruto", image: "profile-5"),
                 .init(title: "Naruto", image: "profile-6"),
                 .init(title: "Naruto", image: "profile-7"),
                 .init(title: "Naruto", image: "profile-8"),
        ])
    }()
    
    private let bottom : ListSection = {
        .bottom([.init(title: "Tokyo Ghoul", image: "soon-1"),
                 .init(title: "Record of Ragnarok", image: "soon-2"),
                 .init(title: "Kaisen Returns", image: "soon-3"),
                 .init(title: "No Idea", image: "soon-4"),
                 .init(title: "Looks interesting", image: "soon-5")])
    }()
    
    var pageData : [ListSection]{
        [top,middle,bottom]
    }
}
