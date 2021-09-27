//
//  welcomeTableItem.swift
//  charity
//
//  Created by Daniyal Hussain on 23/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class welcomeTableItem: UITableViewCell {

    @IBOutlet weak var mediButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var donateButton: UIButton!
    
    @IBOutlet weak var logoutButtton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func foodBtn(_ sender: Any) {
        
    }
    
}
