//
//  EquationTextField.swift
//  UnitConverter
//
//  Created by student on 4/5/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class EquationTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        textAlignment = .right
    }

}
