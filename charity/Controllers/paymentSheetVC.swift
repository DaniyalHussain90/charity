//
//  paymentSheetVC.swift
//  charity
//
//  Created by Daniyal Hussain on 08/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.

import UIKit
import FittedSheets
class paymentSheetVC: UIViewController, UITextFieldDelegate{
    var price:String? = ""

    @IBOutlet weak var priceButton3: UILabel!
    
    @IBOutlet weak var numP1: UITextField!
    @IBOutlet weak var numPad2: UITextField!
    @IBOutlet weak var numP3: UITextField!
    @IBOutlet weak var numP4: UITextField!
    
    
    
    
    
    
    var buttonAction : (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.priceButton3.text =  UserDefaults.standard.string(forKey: "price")
        numP1.delegate = self
        numPad2.delegate = self
        numP3.delegate = self
        numP4.delegate = self

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

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                        
        let maxLength = 3
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 }*/
}

