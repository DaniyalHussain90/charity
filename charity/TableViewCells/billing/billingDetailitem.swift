//
//  billingDetailitem.swift
//  charity
//
//  Created by Daniyal Hussain on 27/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import GoogleMaps
class billingDetailitem: UITableViewCell {

    @IBOutlet weak var ringButton: UIButton!
    @IBOutlet weak var arrowButton:
        UIButton!
    
    
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var googleMaps: GMSMapView!
    
    @IBOutlet weak var crditButtton: UIButton!
    
    @IBOutlet weak var paypalButton: UIButton!
    @IBOutlet weak var googlePayButton: UIButton!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var priceButton2: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
