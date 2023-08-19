//
//  ViewController.swift
//  AirbnbClone
//
//  Created by Muazzez Aydın on 12.08.2023.
//

import UIKit


var residentalTableViewData = [
    
    Residential(title: "Turkey House", imagesList: ["t1","t3", "t2","t4", "t5"],rate: 4.97,   location: "İçmeler Turkey", date: "Sep 3 - 5", distance: 357, price: 3.665),
    
    Residential(title: "Camping", imagesList: ["k1","k2","k3"], rate: 4.83, location: "Sohodol, Romania", date: "Aug 23 - 28",distance: 603 , price: 4.184),
    
    Residential(title: "Historic Luxury Castle", imagesList: ["c1", "c2", "c3", "c4", "c5"],  rate:4.77 , location: "Roseto Capo Spulico, Italy", date: "Aug 27 - Sep 1", distance: 1084, price: 5.037),
    
    Residential(title: "BALIAN TREEHOUSE w beautiful pool", imagesList: ["f1", "f2", "f3", "f4", "f5", "f6", "f7"],  rate:4.85 , location: "Balian Beach, Indonesia", date: "Nov 3 - 9", distance: 14362, price: 337)
    
     
    
   

]

var categoryList = [

    Category(title: "Boats", image: "boat"),
    Category(title: "Farms", image: "farm"),
    Category(title: "Castles", image: "castle"),
    Category(title: "Camping", image: "camp"),
    Category(title: "Mansions", image: "manor"),
    Category(title: "Beachfront", image: "next-sea"),
    Category(title: "Tropical", image: "tropic"),
    Category(title: "Desert", image: "desert"),
]

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        categoryView.layer.shadowColor = UIColor.black.cgColor
        categoryView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        categoryView.layer.shadowRadius = 3
        categoryView.layer.shadowOpacity = 0.2
        
        let shadowRect = CGRect(x: 0, y: categoryView.bounds.height - 3, width: categoryView.bounds.width, height: 3)
                categoryView.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
                
    
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
        cell.distanceLabel.text = "\(item.distance) kilometers away"
        cell.dateLabel.text = item.date
        cell.priceLabel.text = "\(item.price) $ night"
        
        cell.imageList = item.imagesList
       
        return cell
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as!CategoryCollectionViewCell
        
        cell.categoryImage.image = UIImage(named: categoryList[indexPath.row].image!)
        cell.categoryText.text = categoryList[indexPath.row].title
        
        
        return cell
    }
    
}
