//
//  WhiteNoteTableViewCell.swift
//  Douglas
//
//  Created by Nathanael Grant on 9/30/16.
//  Copyright © 2016 Nathanael Grant. All rights reserved.
//

import UIKit

class WhiteNoteTableViewCell: UITableViewCell {

    @IBOutlet weak var NotesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
