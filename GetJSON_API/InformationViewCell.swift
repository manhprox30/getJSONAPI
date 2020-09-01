//
//  InformationViewCell.swift
//  GetJSON_API
//
//  Created by V000232 on 8/31/20.
//  Copyright © 2020 V000232. All rights reserved.
//

import UIKit

class InformationViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
