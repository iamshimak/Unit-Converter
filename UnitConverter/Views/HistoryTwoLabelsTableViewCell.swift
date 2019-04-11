//
//  HistoryTwoLabelsTableViewCell.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 4/11/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class HistoryTwoLabelsTableViewCell: HistoryTableViewCell {
    
    static let identifierr = "historyCellWithTwoLabels"

    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
