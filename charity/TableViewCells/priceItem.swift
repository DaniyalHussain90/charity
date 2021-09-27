//
//  priceItem.swift
//  charity
//
//  Created by Daniyal Hussain on 17/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
class priceItem: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var payButton2: UIButton!
    @IBOutlet weak var payButton3: UIButton!
    @IBOutlet weak var donateButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func Button(_ sender: Any) {
        textView.text = "100"
    }
    
    @IBAction func button2(_ sender: Any) {
        textView.text = "50"
    }
    @IBAction func button3(_ sender: Any) {
        textView.text = "20"
    }
}
