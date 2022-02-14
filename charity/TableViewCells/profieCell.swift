//
//  profieCell.swift
//  charity
//
//  Created by Daniyal Hussain on 13/10/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit

class profieCell: UITableViewCell {

    @IBOutlet weak var bckButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var imgeButton: UIImageView!
    
    @IBOutlet weak var nameButton: UITextField!
    
    @IBOutlet weak var emailButton: UITextField!
    
    
    @IBOutlet weak var phoneButton: UITextField!
    
    @IBOutlet weak var genderButton: UITextField!
    
    @IBOutlet weak var dteButton: UITextField!
    
    @IBOutlet weak var termsButton: UIButton!
    
    @IBOutlet weak var contactButton: UIButton!
    
    
    @IBOutlet weak var logoutButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
