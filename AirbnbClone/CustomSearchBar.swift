//
//  CustomSearchBar.swift
//  AirbnbClone
//
//  Created by Muazzez Aydın on 19.08.2023.
//

import Foundation
import UIKit

class CustomSearchBar : UIView {
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        viewInit()
        
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
        
        
    }
       
    func viewInit (){
        let screenWidth = UIScreen.main.bounds.width
        let textFieldWidth: CGFloat = screenWidth*0.8
        let textFieldHeight: CGFloat = 60
        let textFieldX = (screenWidth - textFieldWidth) / 2

        let textField = UITextField(frame: CGRect(x: textFieldX, y: 5, width: textFieldWidth, height: textFieldHeight))

        let searchIconImageView = UIImageView(image: UIImage(named: "search"))
        searchIconImageView.contentMode = .center
        searchIconImageView.frame = CGRect(x: textFieldHeight, y: 0, width: 30, height: 30)
        //searchIconImageView.backgroundColor = .blue

        let leftPaddingView = UIView(frame: CGRect(x: textFieldHeight, y: textFieldHeight, width: textFieldHeight * 1.5, height: textFieldHeight))
        leftPaddingView.addSubview(searchIconImageView)
        
        let iconLeftMargin: CGFloat = 10
        let iconTopMargin: CGFloat = textFieldHeight*0.25
        searchIconImageView.frame.origin.x = iconLeftMargin
        searchIconImageView.frame.origin.y = iconTopMargin

        textField.leftView = leftPaddingView
        textField.leftViewMode = .always


        textField.layer.cornerRadius = 30.0
        textField.backgroundColor = .systemPink

        let xibView = Bundle.main.loadNibNamed ("CustomSearchBar", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)

        xibView.addSubview(textField)


    }
}
