//
//  pageControl.swift
//  AirbnbClone
//
//  Created by Muazzez Aydın on 13.08.2023.
//

import UIKit

class CustomPageControl: UIPageControl {
    
    let selectedDotSize: CGFloat = 12.0 // Seçili noktanın büyüklüğü
    let dotSize: CGFloat = 8.0 // Diğer noktaların büyüklüğü
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var currentX: CGFloat = 0
        
        for (index, dotView) in subviews.enumerated() {
            var dotFrame = dotView.frame
            let dotWidth = index == currentPage ? selectedDotSize : dotSize
            let dotHeight = dotSize
            
            dotFrame.size = CGSize(width: dotWidth, height: dotHeight)
            dotFrame.origin.x = currentX
            
            dotView.frame = dotFrame
            dotView.layer.cornerRadius = dotFrame.height / 2 // Dairesel görünüm
            dotView.clipsToBounds = true
            
            currentX += dotWidth + 8 // 8 piksel aralık bırakabilirsiniz
        }
    }

}
