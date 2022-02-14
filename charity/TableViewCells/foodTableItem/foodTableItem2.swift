//
//  foodTableItem2.swift
//  charity
//
//  Created by Daniyal Hussain on 04/11/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class foodTableItem2: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
 
    
 
    
  
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var imageButton: UIButton!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var buttonAction : (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsCollectionItem", for: indexPath) as? MealsCollectionItem
            cell?.button.addTarget(self, action: #selector(nextVC(sender:)), for: .touchUpInside)
            cell?.button.tag = 1
            cell?.background.backgroundColor = UIColor(named: "yellow")
                     cell?.price.text = "$12"
                     cell?.mealsNumber.text = "1 Meal"
                return cell!
    }else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsCollectionItem", for: indexPath) as? MealsCollectionItem
            cell?.button.addTarget(self, action: #selector(nextVC(sender:)), for: .touchUpInside)
            cell?.button.tag = 3
            cell?.background.backgroundColor = UIColor(named: "pink")
                     cell?.price.text = "$18"
                     cell?.mealsNumber.text = "2 Meal"
                            return cell!
    }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsCollectionItem", for: indexPath) as? MealsCollectionItem
        
//            cell?.button.addTarget(self, action: #selector(nextVC(sender:)), for: .touchUpInside)
//            cell?.button.tag = 4
            cell?.background.backgroundColor = UIColor(named: "pink")
                     cell?.price.text = "$25"
                     cell?.mealsNumber.text = "3 Meal"
                            return cell!
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
        @objc func nextVC(sender: UIButton){
            if sender.tag == 3{
                UserDefaults.standard.set("$12", forKey: "price") //setObject
            }else{
                UserDefaults.standard.set("$18", forKey: "price") //setObject
            }
            buttonAction?()
            
               
}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 210, height: 210
        )
    }
    
    
}
