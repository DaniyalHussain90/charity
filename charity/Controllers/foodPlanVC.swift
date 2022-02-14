//
//  foodPlanVC.swift
//  charity
//
//  Created by Daniyal Hussain on 26/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class foodPlanVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    @IBOutlet weak var tableView1: UITableView!
    
    var price:String? = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()

            tableView1.delegate = self
           tableView1.dataSource = self
           
           let nibcell=UINib(nibName: "foodPlanTableItem1", bundle: nil)
           tableView1.register(nibcell, forCellReuseIdentifier: "foodPlanTableItem1")

    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return 1
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: "foodPlanTableItem1",for: indexPath) as? foodPlanTableItem1
            cell?.bookButton.addTarget(self, action: #selector(bookButton(sender:)), for: .touchUpInside)
            

            cell?.selectionStyle = .none
            cell?.priceButton.text =  UserDefaults.standard.string(forKey: "price")
            cell?.pressButton.addTarget(self, action: #selector(pressButton(sender:)), for: .touchUpInside)
            cell?.press2.addTarget(self, action: #selector(press2), for: .touchUpInside)
            cell?.bookButton.addTarget(self, action: #selector(bookButton), for: .touchUpInside)
//            cell?.ringBell.addTarget(self, action: #selector(ringBell), for: .touchUpInside)
    cell?.arrowButton.addTarget(self, action: #selector(arrowButton), for: .touchUpInside)
//    cell?.arrowDown.addTarget(self, action: #selector(arrowDown), for: .touchUpInside)

            
                             return cell!

         }
    
    @objc func pressButton (sender: UIButton){
        let buttonTag = sender.tag
        
        print("button is clicked")
        
    }
  
    
    
    
    
    @objc func press2 (sender: UIButton){
        let buttonTag = sender.tag
        
    print("button is clicked")
    
}
    
    @objc func bookButton (sender: UIButton){
           let buttonTag = sender.tag
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "detailVC") as! detailVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }

    
        @objc func ringBell (sender: UIButton){
               let buttonTag = sender.tag
        print("button is clicked")
    }
    
        @objc func arrowButton (sender: UIButton){
               let buttonTag = sender.tag
            self.navigationController?.popViewController(animated: true)
        print("button is clicked")
    }
    
    
        @objc func arrowDown (sender: UIButton){
               let buttonTag = sender.tag
        print("button is clicked")
    }

    

}


