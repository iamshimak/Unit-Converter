//
//  WeightUnitsViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/26/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class WeightUnitsViewController: UIViewController, UITextFieldDelegate {
    
    let ounceText: Int = 1000
    let poundText: Int = 1001
    let kgText: Int = 1002
    let gramText: Int = 1003
    let stonesText: Int = 1004
    
    let textFieldTags: [Int] = [1000, 1001, 1002, 1003, 1004]
    
    var keyboardView: KeyboardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardView = KeyboardView.createKeyboardView()
        //TODO move to seperate function
        keyboardView.onNumberKeyPressed = { number, sign in
            print(number)
        }
        
        UIApplication.shared.keyWindow!.addSubview(keyboardView)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // TODO validations
        let text: String
        let tag = textField.tag
        
        if let _text = textField.text, let _range = Range(range, in: _text) {
            text = _text.replacingCharacters(in: _range, with: string)
        } else {
            text = string
        }
        
        let numberFormatter = NumberFormatter()
        let value = numberFormatter.number(from: text)?.floatValue ?? 0
        updateTextFieldValues(for: tag, value: value)
        
        return true
    }
    
    private func updateTextFieldValues(for tag: Int, value: Float) {
        //TODO check an easy way
        var kgValue: Float = 0
        if tag == ounceText {
            kgValue = Equations.ounce(toKg: value)
        } else if tag == poundText {
            kgValue = Equations.pounds(toKg: value)
        } else if tag == gramText {
            kgValue = Equations.gram(toKg: value)
        }
        
        for textFieldTag in textFieldTags {
            if textFieldTag == tag {
                continue
            }
            
            var textFieldValue: Float = 0
            switch textFieldTag {
            case ounceText:
                textFieldValue = Equations.kg(toOunce: kgValue)
            case poundText:
                textFieldValue = Equations.kg(toPounds: kgValue)
            case gramText:
                textFieldValue = Equations.kg(toGrams: kgValue)
            default:
                break
            }
            
            let textField : UITextField = self.view.viewWithTag(textFieldTag) as! UITextField
            textField.text = String(describing: textFieldValue)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
