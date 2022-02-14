//
//  foodVC2.swift
//  charity
//
//  Created by Daniyal Hussain on 04/11/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class foodVC2: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView10: UITableView!
    
    var price: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView10.delegate = self
        tableView10.dataSource = self
        let nibcell=UINib(nibName: "foodTableItem2", bundle: nil)
tableView10.register(nibcell, forCellReuseIdentifier: "foodTableItem2")

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableItem2") as? foodTableItem2
     cell?.selectionStyle = .none

        //        let nibcell = UINib(nibName: "MealsCollectionItem", bundle: nil)
        cell?.collectionView.register(UINib(nibName: "MealsCollectionItem", bundle: nil), forCellWithReuseIdentifier: "MealsCollectionItem")
        
        cell?.backButton.addTarget(self, action: #selector(backButton(sender:)), for: .touchUpInside)
                          cell?.selectionStyle = .none
                     
        cell!.buttonAction = { [unowned self] in
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                         let myvc = storyBoard.instantiateViewController(withIdentifier: "foodPlanVC") as! foodPlanVC
                                         self.navigationController?.pushViewController(myvc, animated: true)
        }
        //        self.collectionV.register(nibcell ,forCellWithReuseIdentifier: "MealsCollectionItem")
        cell!.collectionView.delegate = cell
        cell!.collectionView.dataSource = cell
        cell?.imageButton.addTarget(self, action: #selector(imgeButton), for: .touchUpInside)

        return cell!

     }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 500
//
//    }
    @objc func backButton(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                      

}
    @objc func imgeButton (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "profileVC") as! profileVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     }*/
