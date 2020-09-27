//
//  DateTableViewCell.swift
//  UnitConverter
//
//  Created by Shimak on 9/27/20.
//  Copyright © 2020 Ahamed Shimak. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    static let identifier = "DateTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
