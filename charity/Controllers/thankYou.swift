//
//  thankYou.swift
//  charity
//
//  Created by Daniyal Hussain on 30/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class thankYou: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView3: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView3.delegate = self
         tableView3.dataSource = self
         
         let nibcell=UINib(nibName: "thankYouitem", bundle: nil)
         tableView3.register(nibcell, forCellReuseIdentifier: "thankYouitem")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                             let myvc = storyBoard.instantiateViewController(withIdentifier: "thankYou") as! thankYou
                             self.navigationController?.pushViewController(myvc, animated: true)


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                       let cell = tableView.dequeueReusableCell(withIdentifier: "thankYouitem",for: indexPath) as? thankYouitem
        cell?.continueButton.addTarget(self, action: #selector(continueButton(sender:)), for: .touchUpInside)

        
        
            cell?.selectionStyle = .none
        return cell!

    }
    
    @objc func continueButton  (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "welcomeVC") as! welcomeVC
        self.dismiss(animated: true, completion: nil)
    }

    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
