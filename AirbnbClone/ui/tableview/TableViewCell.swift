//
//  TableViewCell.swift
//  AirbnbClone
//
//  Created by Muazzez Aydın on 12.08.2023.
//

import UIKit

class TableViewCell : UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var imageList:[String]?
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        collectionView.isPagingEnabled = true
        
        pageControl.numberOfPages = residentalTableViewData[collectionView.tag].imagesList.count
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
    }
    
}


extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        // itemlerın resim sayısı
        return (imageList?.count)!
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath)  as! CollectionViewCell
        collectionCell.imageView.image = UIImage(named: imageList![indexPath.row])
        return collectionCell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = currentIndex
    }

    
}

