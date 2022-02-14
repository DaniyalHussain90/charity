//
//  foodPlanTableItem1.swift
//  charity
//
//  Created by Daniyal Hussain on 14/02/2022.
//  Copyright © 2022 Daniyal Hussain. All rights reserved.
//

import UIKit
import Koyomi

class foodPlanTableItem1: UITableViewCell {

    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var calenderButton: Koyomi!
    @IBOutlet weak var pressButton: CheckBox!
    @IBOutlet weak var press2: CheckBox!
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
