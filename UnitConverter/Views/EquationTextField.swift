//
//  EquationTextField.swift
//  UnitConverter
//
//  Created by student on 4/5/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

@IBDesignable
class EquationTextField: UITextField, UITextFieldDelegate {
    
    @IBInspectable var isNegativeKeyRequired: Bool = false
    
    private var keyboardView: KeyboardView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        
        self.delegate = self
        //self.inputView = keyboardView
        textAlignment = .right
    }
    
    // MARK: - TextField helpers
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView = KeyboardView.shared
        self.inputView = keyboardView
        
        keyboardView.isNegativeKeyHidden = isNegativeKeyRequired
        //KeyboardView.shared.show()
        keyboardView.textField(for: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //KeyboardView.shared.hide()
    }

}
