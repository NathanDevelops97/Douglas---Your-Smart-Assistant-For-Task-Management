//
//  PNCell.swift
//  Douglas
//
//  Created by Nathanael Grant on 10/24/16.
//  Copyright © 2016 Nathanael Grant. All rights reserved.
//

import UIKit

class PNCell: UITableViewCell {

    @IBOutlet weak var TxtLabel: UILabel!
    @IBOutlet weak var PNSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
