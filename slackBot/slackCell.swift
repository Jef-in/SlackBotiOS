//
//  slackCell.swift
//  slackBot
//
//  Created by Arun Aravindakshan on 31/03/19.
//  Copyright © 2019 Jefin. All rights reserved.
//

import UIKit

class slackCell: UITableViewCell {

    @IBOutlet weak var Profimage: UIImageView!
    
    @IBOutlet weak var profname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
