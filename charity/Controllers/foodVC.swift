//
//  foodVC.swift
//  charity
//
//  Created by Daniyal Hussain on 24/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class foodVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {
 
    @IBOutlet weak var TableView: UITableView!
    
    var price: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        TableView.delegate = self
        TableView.dataSource = self
        
              let nibcell=UINib(nibName: "foodTableItem", bundle: nil)
    TableView.register(nibcell, forCellReuseIdentifier: "foodTableItem")

            // Do any additional setup after loading the view.
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableItem") as? foodTableItem
                     cell?.selectionStyle = .none

        
        //        let nibcell = UINib(nibName: "MealsCollectionItem", bundle: nil)
        cell!.collectionV.register(UINib(nibName: "MealsCollectionItem", bundle: nil), forCellWithReuseIdentifier: "MealsCollectionItem")
        
        cell?.arrowButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
                          cell?.selectionStyle = .none
                     
        cell!.buttonAction = { [unowned self] in
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                         let myvc = storyBoard.instantiateViewController(withIdentifier: "foodPlanVC") as! foodPlanVC
                                         self.navigationController?.pushViewController(myvc, animated: true)
        }
        //        self.collectionV.register(nibcell ,forCellWithReuseIdentifier: "MealsCollectionItem")
        cell!.collectionV.delegate = cell
        cell!.collectionV.dataSource = cell
        return cell!

     }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 500
//        
//    }
    @objc func back(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                      

}

    
}
