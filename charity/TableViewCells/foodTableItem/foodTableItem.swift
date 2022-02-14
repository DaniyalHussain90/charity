//
//  foodTableItem.swift
//  charity
//
//  Created by Daniyal Hussain on 24/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class foodTableItem: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionV: UICollectionView!
    @IBOutlet weak var arrowButton: UIButton!
    
    @IBOutlet weak var imgeButton: UIButton!
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var schedulsButton: UIButton!
    @IBOutlet weak var trackButton: UIButton!
    
    @IBOutlet weak var enjoyButton: UIButton!
    
    var buttonAction : (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsCollectionItem", for: indexPath) as? MealsCollectionItem
            cell?.button.addTarget(self, action: #selector(nextVC(sender:)), for: .touchUpInside)
            cell?.button.tag = 1
            cell?.background.backgroundColor = UIColor(named: "yellow")
                     cell?.price.text = "$12"
                     cell?.mealsNumber.text = "1 Meal"
                return cell!
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsCollectionItem", for: indexPath) as? MealsCollectionItem
            cell?.button.addTarget(self, action: #selector(nextVC(sender:)), for: .touchUpInside)
            cell?.button.tag = 2
            cell?.background.backgroundColor = UIColor(named: "pink")
                     cell?.price.text = "$18"
                     cell?.mealsNumber.text = "2 Meal"
                            return cell!
        }
        }
    
        @objc func nextVC(sender: UIButton){
            if sender.tag == 2{
                UserDefaults.standard.set("$12", forKey: "price") //setObject
            }else{
                UserDefaults.standard.set("$18", forKey: "price") //setObject
            }
            buttonAction?()
            
               
}
    
}
