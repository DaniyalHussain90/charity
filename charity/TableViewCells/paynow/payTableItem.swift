//
//  payTableItem.swift
//  charity
//
//  Created by Daniyal Hussain on 30/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class payTableItem: UITableViewCell {
    
    @IBOutlet weak var swipeButton: UIButton!
    @IBOutlet weak var nameCardButton: UITextField!
    
    @IBOutlet weak var cardButton: UIStackView!
    @IBOutlet weak var expireButton: UITextField!
    @IBOutlet weak var cvvButton: UITextField!
    @IBOutlet weak var payButton: UIButton!
    
    @IBOutlet weak var priceButton3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func payButton(_ sender: Any) {

}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
