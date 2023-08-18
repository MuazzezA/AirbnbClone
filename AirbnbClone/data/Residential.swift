//
//  Residential.swift
//  AirbnbClone
//
//  Created by Muazzez Aydın on 13.08.2023.
//

import Foundation

class Residential {
    var title: String
    var imagesList: [String]
    var rate: Float?
    var location: String
    var date: String
    var distance: Int
    var price: Float
    
    init(title: String, imagesList: [String], rate: Float? = nil, location: String, date: String, distance: Int, price: Float) {
        self.title = title
        self.imagesList = imagesList
        self.rate = rate
        self.location = location
        self.date = date
        self.distance = distance
        self.price = price
    }
   
}
