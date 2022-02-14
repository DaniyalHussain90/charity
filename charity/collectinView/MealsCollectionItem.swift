//
//  MealsCollectionItem.swift
//  charity
//
//  Created by Daniyal Hussain on 24/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class MealsCollectionItem: UICollectionViewCell {
    let vc = foodVC2()
    var reviewAction : (() -> ())?
    @IBOutlet weak var mealsNumber: UILabel!
    var price1:String?
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var background: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        price.text=price1
        // Initialization code
    }
    func bind(ad:Int){
        
    }
    @IBAction func button(_ sender: Any) {
        reviewAction?()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "foodPlanVC") as! foodPlanVC
        self.vc.navigationController?.pushViewController(myvc, animated: true)
    }
    
    @IBAction func btn(_ sender: Any) {
        reviewAction?()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "foodPlanVC") as! foodPlanVC
        myvc.price = self.price1
        self.vc.navigationController?.pushViewController(myvc, animated: true)
    }
}
