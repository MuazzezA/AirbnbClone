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
        textField.backgroundColor = .white
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowRadius = 3
        
       

        let xibView = Bundle.main.loadNibNamed ("CustomSearchBar", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)

        xibView.addSubview(textField)
        addEqualizerIcon(to: textField)
        addTextWithStack(to: textField)

    }
    
    
    
    func addEqualizerIcon(to textField: UITextField) {
        let equalizerIconImageView = UIImageView(image: UIImage(named: "equalizer"))
        equalizerIconImageView.contentMode = .center
        equalizerIconImageView.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
      
        let circleView = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        circleView.layer.cornerRadius = 15
        circleView.backgroundColor = .white
        circleView.layer.shadowColor = UIColor.black.cgColor
        circleView.layer.shadowOpacity = 0.2
        circleView.layer.shadowOffset = CGSize(width: 0, height: 2)
        circleView.layer.shadowRadius = 3
        
        equalizerIconImageView.center = CGPoint(x: circleView.frame.width / 2, y: circleView.frame.height / 2)
  
        circleView.addSubview(equalizerIconImageView)
        textField.rightView = circleView
        textField.rightViewMode = .always
    }
    
    
    func addTextWithStack(to textField: UITextField) {

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
    
        let label1 = UILabel()
        label1.text = "Where to ?"
        label1.font = UIFont.boldSystemFont(ofSize: 18)
        label1.textColor = UIColor.black
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label1)
        
        let label2 = UILabel()
        label2.text = "Anywhere · Any Week 2 · quests"
        label2.font = UIFont.systemFont(ofSize: 14)
        label2.textColor = UIColor.darkGray
        label2.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label2)
        textField.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: textField.leadingAnchor, constant: 160),
            stackView.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
        ])
    }

    


    
    
}
