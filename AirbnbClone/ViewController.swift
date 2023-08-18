//
//  ViewController.swift
//  AirbnbClone
//
//  Created by Muazzez Aydın on 12.08.2023.
//

import UIKit

var residentalTableViewData = [
    
    Residential(title: "Sataplia Kulubesi", imagesList: ["img1","img2", "img3"], rate: 4.83, location: "Imereti, Gürcistan", date: "6 - 13 Eyl",distance: 603 , price: 2.922),
    
    Residential(title: "Cabana A Vaideni", imagesList: ["img4","img4", "img4","img4"],  location: "Vaideeni, Romanya", date: "31 Ağu - 5 Eyl", distance: 497, price: 11.236)
    
]

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return residentalTableViewData.count;
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return residentalTableViewData.count
//    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = residentalTableViewData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! TableViewCell
        
        cell.location.text = "\(item.location)"
        cell.rate.text = "\(item.rate ?? 0.0)"
        cell.titleLabel.text = item.title
        cell.distanceLabel.text = "\(item.distance) km uzakta"
        cell.dateLabel.text = item.date
        cell.priceLabel.text = "\(item.price) ₺ gece"
        
        cell.imageList = item.imagesList
       
        return cell
        
    }
    
    
    
}

