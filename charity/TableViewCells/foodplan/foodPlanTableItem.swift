//
//  foodPlanTableItem.swift
//  charity
//
//  Created by Daniyal Hussain on 26/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import Koyomi

class foodPlanTableItem: UITableViewCell {
    
    @IBOutlet weak var arrowButton: UIButton!
    
    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var arrowDown: UIButton!
    
    @IBOutlet weak var ringBell: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var logoButton: UIButton!
    
    @IBOutlet weak var calenderButton: Koyomi!
    
    @IBOutlet weak var pressButton: UIButton!
    @IBOutlet weak var press2: UIButton!
    
    @IBOutlet weak var bookButton: UIButton!
    
    @IBOutlet weak var priceButton: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
