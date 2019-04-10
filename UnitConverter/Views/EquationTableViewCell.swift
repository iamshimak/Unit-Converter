//
//  EquationTableViewCell.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class EquationTableViewCell: UITableViewCell {
    
    static let identifier = "constantCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateValues(title: String, attributedEquation: NSAttributedString, unit: NSAttributedString) {
        titleLabel.text = title
        equationLabel.attributedText = attributedEquation
        unitLabel.attributedText = unit
    }

}
