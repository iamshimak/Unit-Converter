//
//  LengthViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/31/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class LengthUnitsViewController: UnitsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Textfield Delegates
    
    override func textfield(value: Float,for tag: Int) {
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
    
    override func textFields() -> [Int] {
        return ViewTags.Length.lengthTexts
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
        AlertManager.showSaveAlert(self)
    }

}
