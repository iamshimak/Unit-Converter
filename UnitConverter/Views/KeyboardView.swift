//
//  KeyboardView.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/28/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class KeyboardView: UIView {
    
    // Block methods to setup by other class
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
    
    var isOnDisplay = false
    var isScrollViewShrinked = false
    
    var scrollView: UIScrollView?
    
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
        let width = UIScreen.main.bounds.width
        let height  = UIScreen.main.bounds.height
        let kbHeight = width - 50
        let modifieFframe = CGRect.init(x: 0, y: height - kbHeight, width: width, height: kbHeight)
        self.frame = modifieFframe
        hide()
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
                
                onNumberKeyPressed!(currentSign,
                                    textFieldFormat.floatValue,
                                    numberKeyFormat.floatValue,
                                    textField.tag)
                textField.insertText(numberKey)
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
        hide()
    }
    
    func show() {
        UIView.animate(withDuration: 0.3, animations: {
            let kFrame = self.frame
            let kHeight = UIScreen.main.bounds.height - KeyboardView.height
            self.frame = CGRect(x: kFrame.minX, y: kHeight, width: kFrame.width, height: kFrame.height)
        }) { finished in
            
        }
        
        // Logic to bring scrollview up to uitextfield
        if let _scrollView = scrollView {
            var viewFrame = _scrollView.frame
            viewFrame.size.height -= KeyboardView.height
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            _scrollView.frame = viewFrame
            UIView.commitAnimations()
            
            isOnDisplay = true
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            let kFrame = self.frame
            let kHeight = UIScreen.main.bounds.height
            self.frame = CGRect(x: kFrame.minX, y: kHeight, width: kFrame.width, height: kFrame.height)
        }) { finished in
            
        }
        
        // Logic to bring down scrollview
        if let _scrollView = scrollView {
            var viewFrame = _scrollView.frame
            viewFrame.size.height += KeyboardView.height
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            _scrollView.frame = viewFrame
            UIView.commitAnimations()
            
            isOnDisplay = false
        }
    }
    
}
