//
//  HistoryTableViewCell.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "historyCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
