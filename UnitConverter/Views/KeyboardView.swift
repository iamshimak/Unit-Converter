//
//  KeyboardView.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/28/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class KeyboardView: UIView {
    
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
    // Block methods to setup by other class
    var onClearKeynPressed: (() -> Void)?
    var onClearAllKeyPressed: (() -> Void)?
    var onHideKeyPressed: (() -> Void)?
    var onSignKeyPressed: ((_ sign: Sign) -> Void)?
    var onNumberKeyPressed: ((_ sign: Sign, _ number: Float, _ pressedNumber: Float, _ tag: Int) -> Void)?
    
    var isOnDisplay = false
    var isScrollViewShrinked = false
    
    var scrollView: UIScrollView?
    
    var selectedTextField: UITextField?
    
    private var currentSign: Sign = .positive
    
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
        if let onNumberKeyPressed = onNumberKeyPressed,
            let numberKey = sender.titleLabel!.text,
            let numberKeyFormat = NumberFormatter().number(from: numberKey) {
            
            if let textField = selectedTextField {
                if let textFieldText = textField.text,
                    let textFieldFormat = NumberFormatter().number(from: "\(textFieldText)\(numberKeyFormat)") {
                    
                    onNumberKeyPressed(currentSign, textFieldFormat.floatValue, numberKeyFormat.floatValue, selectedTextField?.tag ?? -1)
                    textField.insertText(numberKey)
                    
                    if currentSign == .negative {
                        //TODO negative value
                    }
                }
            }
        }
    }
    
    @IBAction func dotKey(_ sender: UIButton) {
        if let onNumberKeyPressed = onNumberKeyPressed,
            let numberKey = sender.titleLabel!.text {
            
        }
    }
    
    @IBAction func clearAllKey(_ sender: UIButton) {
        if let onClearAllKeyPressed = onClearKeynPressed {
            onClearAllKeyPressed()
        }
    }
    
    @IBAction func clearKey(_ sender: UIButton) {
    }
    
    @IBAction func signKey(_ sender: UIButton) {
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
        
        
        isOnDisplay = true
        if let _scrollView = scrollView {
            if _scrollView.frame.height / 2 > KeyboardView.height {
                isScrollViewShrinked = true
                _scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: KeyboardView.height, right: 0.0)
                _scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: KeyboardView.height, right: 0.0)
            }
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            let kFrame = self.frame
            let kHeight = UIScreen.main.bounds.height
            self.frame = CGRect(x: kFrame.minX, y: kHeight, width: kFrame.width, height: kFrame.height)
        }) { finished in
            
        }
        
        isOnDisplay = false
        if let _scrollView = scrollView {
            if isScrollViewShrinked {
                _scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                _scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            }
        }
    }
    
}
