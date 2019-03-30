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
    
    var onClearKeynPressed: (() -> Void)?
    var onClearAllKeyPressed: (() -> Void)?
    var onHideKeyPressed: (() -> Void)?
    var onSignKeyPressed: ((_ sign: Sign) -> Void)?
    var onNumberKeyPressed: ((_ sign: Sign, _ number: Float, _ tag: Int) -> Void)?
    
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
    
    func setup() {
        self.isHidden = true
        
        let width = UIScreen.main.bounds.width
        let height  = UIScreen.main.bounds.height
        let kbHeight = width - 50
        let modifieFframe = CGRect.init(x: 0, y: height - kbHeight, width: width, height: kbHeight)
        self.frame = modifieFframe
    }
    
    func textField(for texfield: UITextField) {
        selectedTextField = texfield
    }
    
    func unselectTextField() {
        selectedTextField = nil
    }

    @IBAction func numberKey(_ sender: UIButton) {
        if let onNumberKeyPressed = onNumberKeyPressed,
            let key = sender.titleLabel!.text,
            let text = NumberFormatter().number(from: key) {
            if currentSign == .negative {
                
            }
            onNumberKeyPressed(currentSign, text.floatValue, selectedTextField?.tag ?? -1)
            
            if let textField = selectedTextField {
                textField.insertText(key)
            }
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
    }
    
    func show() {
        isOnDisplay = true
        isHidden = false
        
        if let _scrollView = scrollView {
            if _scrollView.frame.height / 2 > KeyboardView.height {
                isScrollViewShrinked = true
                _scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: KeyboardView.height, right: 0.0)
                _scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: KeyboardView.height, right: 0.0)
            }
        }
    }
    
    func hide() {
        isOnDisplay = false
        isHidden = true
        
        if let _scrollView = scrollView {
            if isScrollViewShrinked {
                _scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                _scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
