//
//  priceVC.swift
//  charity
//
//  Created by Daniyal Hussain on 17/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class priceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView6: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView6.delegate = self
        tableView6.dataSource = self
        
        
        
        let nibcell=UINib(nibName: "priceItem", bundle: nil)
        tableView6.register(nibcell, forCellReuseIdentifier: "priceItem")

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priceItem",for: indexPath) as? priceItem
        cell?.donateButton.addTarget(self, action: #selector(donateButton(sender:)), for: .touchUpInside)
        cell?.backButton.addTarget(self, action: #selector(backButton(sender:)), for: .touchUpInside)


         return cell!
    }
    @objc func donateButton (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "detailVC") as! detailVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }
     
    @objc func backButton (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "detailVC") as! detailVC
        self.navigationController?.popViewController(animated: true)
    }

  

}
