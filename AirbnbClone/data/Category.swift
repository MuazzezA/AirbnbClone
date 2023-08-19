//
//  Category.swift
//  AirbnbClone
//
//  Created by Muazzez Aydın on 19.08.2023.
//

import Foundation

class Category {
    
    var title:String?
    var image:String?
    
    init(title: String? = nil, image: String? = nil) {
        self.title = title
        self.image = image
    }
}
