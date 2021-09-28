//
//  detailVC.swift
//  charity
//
//  Created by Daniyal Hussain on 27/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import GoogleMaps
import FittedSheets
class detailVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var price:String? = ""

    
    @IBOutlet weak var tableView2: UITableView!
    
    
    var buttonAction : (() -> ())?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
            tableView2.delegate = self
            tableView2.dataSource = self
            
                  let nibcell=UINib(nibName: "billingDetailitem", bundle: nil)
        tableView2.register(nibcell, forCellReuseIdentifier: "billingDetailitem")


    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                                let cell = tableView.dequeueReusableCell(withIdentifier: "billingDetailitem") as? billingDetailitem
        cell?.arrowButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        cell?.checkButton.addTarget(self, action: #selector(connected), for: .touchUpInside)
cell?.selectionStyle = .none
        cell?.priceButton2.text =  UserDefaults.standard.string(forKey: "price")
        cell?.editButton.addTarget(self, action: #selector(editButton), for: .touchUpInside)

        
        return cell!
}
    
    
    
    @objc func back(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
      }
    
    @objc func connected(sender: UIButton){
        let controller = paymentSheetVC()
        let option = SheetOptions(
            pullBarHeight: 30)
        let sheet = SheetViewController(controller: controller, sizes: [.percent(0.60), .intrinsic], options: option)
      
        self.present(sheet, animated: true, completion: nil)
    }
    
    
    @objc func nextVC(sender: UIButton){
        if sender.tag == 1{
            UserDefaults.standard.set("$12", forKey: "price") //setObject
        }else{
            UserDefaults.standard.set("$18", forKey: "price") //setObject
        }
        buttonAction?()
        
       }

    
    @objc func editButton (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "mapVC") as! mapVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }
}
