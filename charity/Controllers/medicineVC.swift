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
    
    let spinner = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.startAnimating()
        
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
        
        
        tableView7.dataSource = self
        tableView7.delegate = self
       
        
        let nibcell=UINib(nibName: "medicineItem1", bundle: nil)
        tableView7.register(nibcell, forCellReuseIdentifier: "medicineItem1")
        data(limit: 10)

    }
    
    func data(limit:Int){
        medicineManager.shared.getAllMedicineNameForm(limit: 20) { [self] data in
            arr = data
            MBProgressHUD.hide(for: view, animated: true)
            tableView7.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicineItem1",for: indexPath) as? medicineItem1
        cell?.name1.text = arr[indexPath.row]
//        cell?.name2.text = arr2[indexPath.row]
      return cell!
    }
    

  
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let count = self.arr.count - 1
            if self.arr.count >= count {
                let count = self.arr.count
                let lastElement = count - 1
                let lastPost = self.arr.count
                print(lastPost)
                
                if indexPath.section == lastElement {
                    
                 
                
                        spinner.startAnimating()
                        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView7.bounds.width, height: CGFloat(44))
                        self.tableView7.tableFooterView = spinner
                        self.tableView7.tableFooterView?.isHidden = false
                        
                    self.data(limit: 10)
                }
                
 
            }
            
            
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
