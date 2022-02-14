//
//  profileVC.swift
//  charity
//
//  Created by Daniyal Hussain on 14/10/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class profileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableViewPro: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewPro.delegate = self
       tableViewPro.dataSource = self
        
        userManager.shared.getUser { User, Error in
            
        }
        let nibcell=UINib(nibName: "profieCell", bundle: nil)
tableViewPro.register(nibcell, forCellReuseIdentifier: "profieCell")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewPro.dequeueReusableCell(withIdentifier: "profieCell") as? profieCell

        cell?.selectionStyle = .none
        cell?.bckButton.addTarget(self, action: #selector(bckButton(sender:)), for: .touchUpInside)

        return cell!

}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func bckButton(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
      }


    }

