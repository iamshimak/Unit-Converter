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
    @IBOutlet weak var equationLabel: MTMathUILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateValues(title: String, equation: String) {
        titleLabel.text = title
        equationLabel.latex = equation
    }

}
