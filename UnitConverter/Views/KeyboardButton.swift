//
//  KeyboardButton.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 4/5/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class KeyboardButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    
}
