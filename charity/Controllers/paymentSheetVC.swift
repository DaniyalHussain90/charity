//
//  paymentSheetVC.swift
//  charity
//
//  Created by Daniyal Hussain on 08/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class paymentSheetVC: UIViewController {
    var price:String? = ""

    @IBOutlet weak var priceButton3: UILabel!
    var buttonAction : (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.priceButton3.text =  UserDefaults.standard.string(forKey: "price")

    }

    
    @IBAction func payButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                             let myvc = storyBoard.instantiateViewController(withIdentifier: "thankYou") as! thankYou

        self.present(myvc, animated: true, completion: nil)
}
    
    @objc func nextVC(sender: UIButton){
        if sender.tag == 1{
            UserDefaults.standard.set("$12", forKey: "price") //setObject
        }else{
            UserDefaults.standard.set("$18", forKey: "price") //setObject
        }
        buttonAction?()
        
       }

    
    

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 }*/
