//
//  ViewController.swift
//  charity
//
//  Created by Daniyal Hussain on 23/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import FirebaseAuth
class welcomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

            tableView.delegate = self
             tableView.dataSource = self
             
             let nibcell=UINib(nibName: "welcomeTableItem", bundle: nil)
             tableView.register(nibcell, forCellReuseIdentifier: "welcomeTableItem")
}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
       }
       
    
               func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "welcomeTableItem",for: indexPath) as? welcomeTableItem
                cell?.donateButton.addTarget(self, action: #selector(donateButton(sender:)), for: .touchUpInside)

                cell?.foodButton.addTarget(self, action: #selector(foodButton(sender:)), for: .touchUpInside)
                cell?.mediButton.addTarget(self, action: #selector(mediButton(sender:)), for: .touchUpInside)
                cell?.logoutButtton.addTarget(self, action: #selector(logoutButtton(sender:)), for: .touchUpInside)

                   cell?.selectionStyle = .none
               return cell!

       }
       
    @objc func foodButton(sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "foodVC2") as! foodVC2
        self.navigationController?.pushViewController(myvc, animated: true)
    }
    

    @objc func donateButton (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "priceVC") as! priceVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }
    
    @objc func mediButton (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "medicineVC") as! medicineVC
        self.navigationController?.pushViewController(myvc, animated: true)

    
}
    @objc func logoutButtton  (sender: UIButton){
      
        let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Auth", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "nav")
                    newViewController.modalPresentationStyle = .fullScreen
                    self.navigationController?.present(newViewController, animated: true, completion: nil)
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
}
    
}
