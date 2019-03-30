//
//  LengthViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/31/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class LengthUnitsViewController: UnitsViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupKeyBoard(scrollView)
    }
    
    // MARK: Textfield Delegates
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.show()
        keyboardView.textField(for: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardView.hide()
    }
    
    override func onNumberKeyPressed(number: Float, sign: KeyboardView.Sign, tag: Int) {
        textfield(value: number, for: tag)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // TODO validations
        let tag = textField.tag
        let value = TextUtils.numberValue(for: textField.text, range: range, replaceString: string)
        textfield(value: value, for: tag)
        
        return true
    }
    
    private func textfield(value: Float,for tag: Int) {
        //TODO check an easy way
        print("Value: \(value) Tag: \(tag)")
        switch tag {
        case ViewTags.Length.meterText:
            var conValue = Equations.Length.meter(toMile: value)
            updateTextField(tag: ViewTags.Length.mileText, value: conValue)
            
            conValue = Equations.Length.meter(toCm: value)
            updateTextField(tag: ViewTags.Length.cmText, value: conValue)
            
            conValue = Equations.Length.meter(toMm: value)
            updateTextField(tag: ViewTags.Length.mmText, value: conValue)
            
            conValue = Equations.Length.meter(toYard: value)
            updateTextField(tag: ViewTags.Length.yardText, value: conValue)
            
            conValue = Equations.Length.meter(toInch: value)
            updateTextField(tag: ViewTags.Length.inchText, value: conValue)
            
        case ViewTags.Length.mileText:
            var conValue = Equations.Length.mile(toMeter: value)
            updateTextField(tag: ViewTags.Length.meterText, value: conValue)
            
            conValue = Equations.Length.mile(toCm: value)
            updateTextField(tag: ViewTags.Length.cmText, value: conValue)
            
            conValue = Equations.Length.mile(toMm: value)
            updateTextField(tag: ViewTags.Length.mmText, value: conValue)
            
            conValue = Equations.Length.mile(toYard: value)
            updateTextField(tag: ViewTags.Length.yardText, value: conValue)
            
            conValue = Equations.Length.mile(toInch: value)
            updateTextField(tag: ViewTags.Length.inchText, value: conValue)
            
        case ViewTags.Length.cmText:
            var conValue = Equations.Length.cm(toMeter: value)
            updateTextField(tag: ViewTags.Length.meterText, value: conValue)
            
            conValue = Equations.Length.cm(toMile: value)
            updateTextField(tag: ViewTags.Length.mileText, value: conValue)
            
            conValue = Equations.Length.cm(toMm: value)
            updateTextField(tag: ViewTags.Length.mmText, value: conValue)
            
            conValue = Equations.Length.cm(toYard: value)
            updateTextField(tag: ViewTags.Length.yardText, value: conValue)
            
            conValue = Equations.Length.cm(toInch: value)
            updateTextField(tag: ViewTags.Length.inchText, value: conValue)
            
        case ViewTags.Length.mmText:
            var conValue = Equations.Length.mm(toMeter: value)
            updateTextField(tag: ViewTags.Length.meterText, value: conValue)
            
            conValue = Equations.Length.mm(toMile: value)
            updateTextField(tag: ViewTags.Length.mileText, value: conValue)
            
            conValue = Equations.Length.mm(toCm: value)
            updateTextField(tag: ViewTags.Length.cmText, value: conValue)
            
            conValue = Equations.Length.mm(toYard: value)
            updateTextField(tag: ViewTags.Length.yardText, value: conValue)
            
            conValue = Equations.Length.mm(toInch: value)
            updateTextField(tag: ViewTags.Length.inchText, value: conValue)
            
        case ViewTags.Length.yardText:
            var conValue = Equations.Length.yard(toMeter: value)
            updateTextField(tag: ViewTags.Length.meterText, value: conValue)
            
            conValue = Equations.Length.yard(toMile: value)
            updateTextField(tag: ViewTags.Length.mileText, value: conValue)
            
            conValue = Equations.Length.yard(toCm: value)
            updateTextField(tag: ViewTags.Length.cmText, value: conValue)
            
            conValue = Equations.Length.yard(toMm: value)
            updateTextField(tag: ViewTags.Length.mmText, value: conValue)
            
            conValue = Equations.Length.yard(toInch: value)
            updateTextField(tag: ViewTags.Length.inchText, value: conValue)
            
        case ViewTags.Length.inchText:
            var conValue = Equations.Length.inch(toMeter: value)
            updateTextField(tag: ViewTags.Length.meterText, value: conValue)
            
            conValue = Equations.Length.inch(toMiles: value)
            updateTextField(tag: ViewTags.Length.mileText, value: conValue)
            
            conValue = Equations.Length.inch(toCm: value)
            updateTextField(tag: ViewTags.Length.cmText, value: conValue)
            
            conValue = Equations.Length.inch(toMm: value)
            updateTextField(tag: ViewTags.Length.mmText, value: conValue)
            
            conValue = Equations.Length.inch(toYard: value)
            updateTextField(tag: ViewTags.Length.yardText, value: conValue)
        default:
            break
        }
    }
    
    // MARK: Save model
    
    override func onSaveButtonPressed() {
        let lengthEquation = Equations.Length(meter: getTextFieldValue(from: ViewTags.Length.meterText),
                                              mile: getTextFieldValue(from: ViewTags.Length.mileText),
                                              cm: getTextFieldValue(from: ViewTags.Length.cmText),
                                              mm: getTextFieldValue(from: ViewTags.Length.mmText),
                                              yard: getTextFieldValue(from: ViewTags.Length.yardText),
                                              inch: getTextFieldValue(from: ViewTags.Length.inchText))

        EquationsStoreManager.save(lengthEquation)
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
