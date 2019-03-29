//
//  KeyboardView.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/28/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class KeyboardView: UIView {
    
    var onClearKeynPressed: (() -> Void)?
    var onClearAllKeyPressed: (() -> Void)?
    var onHideKeyPressed: (() -> Void)?
    var onSignKeyPressed: ((_ sign: Sign) -> Void)?
    var onNumberKeyPressed: ((_ number: Int, _ sign: Sign) -> Void)?
    
    static var height: CGFloat {
        get {
            let width = UIScreen.main.bounds.width
            return width - 50
        }
    }
    
    private var currentSign: Sign = .positive
    
    enum Sign {
        case positive
        case negative
    }
    
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
        let width = UIScreen.main.bounds.width
        let height  = UIScreen.main.bounds.height
        let kbHeight = width - 50
        let modifieFframe = CGRect.init(x: 0, y: height - kbHeight, width: width, height: kbHeight)
        self.frame = modifieFframe
    }

    @IBAction func numberKey(_ sender: UIButton) {
        if let onNumberKeyPressed = onNumberKeyPressed {
            onNumberKeyPressed(Int(sender.titleLabel!.text!)!, currentSign)
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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
