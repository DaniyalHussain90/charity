//
//  medicineVC.swift
//  charity
//
//  Created by Daniyal Hussain on 21/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import MBProgressHUD

class medicineVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var tableView7: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    
    var arr = [String]()
    var arr2 = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
        
        medicineManager.shared.getAllMedicineNameForm { [self] data in
            arr = data
            MBProgressHUD.hide(for: view, animated: true)
            tableView7.reloadData()
        }
        
//        medicineManager.shared.getAllCountryNameForm { [self] country in
//            arr2 = country
//            tableView7.reloadData()
//        }
//
        tableView7.dataSource = self
        tableView7.delegate = self
       
        
        let nibcell=UINib(nibName: "medicineItem", bundle: nil)
        tableView7.register(nibcell, forCellReuseIdentifier: "medicineItem")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicineItem",for: indexPath) as? medicineItem
        cell?.name1.text = arr[indexPath.row]
//        cell?.name2.text = arr2[indexPath.row]
      return cell!
    }
    

  
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
