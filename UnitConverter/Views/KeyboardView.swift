//
//  KeyboardView.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/28/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class KeyboardView: UIView {
    
    @IBOutlet weak var negativeKey: KeyboardButton!
    @IBOutlet weak var negativeKeyTopConstraint: NSLayoutConstraint!
    
    /// Closure methods to setup by other class
    var onClearKeynPressed: (() -> Void)?
    var onClearAllKeyPressed: (() -> Void)?
    var onHideKeyPressed: (() -> Void)?
    var onSignKeyPressed: ((_ sign: Sign) -> Void)?
    var onNumberKeyPressed: ((_ sign: Sign, _ number: Float?, _ pressedNumber: Float?, _ tag: Int) -> Void)?
    
    enum Sign {
        case positive
        case negative
    }
    
    static var height: CGFloat {
        get {
            let width = UIScreen.main.bounds.width
            return width - 50
        }
    }
    
    var isNegativeKeyHidden: Bool {
        get {
            return negativeKeyTopConstraint.isActive
        }
        set (value) {
            negativeKeyTopConstraint.priority = value ? .init(999) : .init(249)
            negativeKey.isHidden = !value
        }
    }
    
    var selectedTextField: UITextField?
    
    private var currentSign: Sign = .positive
    
    static let shared = createKeyboardView()
    
    static func createKeyboardView() -> KeyboardView {
        return Bundle.main.loadNibNamed("KeyboardView", owner: self, options: nil)?.first as! KeyboardView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Initalize keyboard view
    func setup() {
        let modifieFframe = CGRect.init(x: 0, y: 0, width: 0, height: 250)
        self.frame = modifieFframe
        //isHidden = true
        //hide()
    }
    
    func textField(for texfield: UITextField) {
        selectedTextField = texfield
    }
    
    func unselectTextField() {
        selectedTextField = nil
    }
    
    // MARK: - Keyboard Actions
    // Logic for get text from keyboard and pass to viewcontroller
    @IBAction func numberKey(_ sender: UIButton) {
        if let _ = onNumberKeyPressed,
            let numberKey = sender.titleLabel!.text,
            let numberKeyFormat = NumberFormatter().number(from: numberKey),
            let textField = selectedTextField {
            
            if let textFieldText = textField.text,
                let textFieldFormat = NumberFormatter().number(from: "\(textFieldText)\(numberKeyFormat)") {
                textField.insertText(numberKey)
                
                onNumberKeyPressed!(currentSign,
                                    textFieldFormat.floatValue,
                                    numberKeyFormat.floatValue,
                                    textField.tag)
            }
        }
    }
    
    @IBAction func dotKey(_ sender: UIButton) {
        if let textField = selectedTextField,
            let text = selectedTextField?.text {
            
            if !text.contains(".") {
                textField.insertText(".")
            }
        }
    }
    
    @IBAction func clearAllKey(_ sender: UIButton) {
        if let onClearAllKeyPressed = onClearKeynPressed {
            onClearAllKeyPressed()
        }
        
        if selectedTextField != nil {
            onNumberKeyPressed!(currentSign,
                                nil,
                                nil,
                                selectedTextField!.tag)
            
            currentSign = .positive
        }
    }
    
    @IBAction func clearKey(_ sender: UIButton) {
        if let textField = selectedTextField,
            var text = selectedTextField?.text,
            text.count > 0 {
            
            text.remove(at: text.index(before: text.endIndex))
            textField.text = text == "" ? nil : text
            
            if text == "-" || text == "" {
                clearAllKey(sender)
            }
            
            let textFieldFormat = NumberFormatter().number(from: text)
            onNumberKeyPressed!(currentSign,
                                textFieldFormat?.floatValue,
                                nil,
                                textField.tag)
            
        }
    }
    //TODO not assigning when - as first index
    @IBAction func signKey(_ sender: UIButton) {
        if let textField = selectedTextField {
            
            var text = selectedTextField?.text ?? ""
            
            if !text.contains("-") {
                text.insert("-", at: text.startIndex)
                textField.text = text
                
                currentSign = .negative
                let textFieldFormat = NumberFormatter().number(from: text)
                
                onNumberKeyPressed!(currentSign,
                                    textFieldFormat?.floatValue,
                                    nil,
                                    textField.tag)
            }
        }
    }
    
    @IBAction func hideKey(_ sender: Any) {
        if let textField = selectedTextField {
            textField.endEditing(true)
        }
    }
    
}
