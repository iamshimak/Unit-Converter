//
//  TemperatureViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 4/7/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class TemperatureViewController: UnitsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Textfield Delegates
    
    override func textfield(value: Float,for tag: Int) {
        print("Value: \(value) Tag: \(tag)")
        switch tag {
        case ViewTags.Temperature.celsiusText:
            var conValue = Equations.Temperature.celsious(toFahrenheit: value)
            updateTextField(tag: ViewTags.Temperature.fahrenheitText, value: conValue)
            
            conValue = Equations.Temperature.celsious(toKelvin: value)
            updateTextField(tag: ViewTags.Temperature.kelvinText, value: conValue)
            
        case ViewTags.Temperature.fahrenheitText:
            var conValue = Equations.Temperature.fahrenheit(toCelsious: value)
            updateTextField(tag: ViewTags.Temperature.celsiusText, value: conValue)
            
            conValue = Equations.Temperature.fahrenheit(toKelvin: value)
            updateTextField(tag: ViewTags.Temperature.kelvinText, value: conValue)
            
        case ViewTags.Temperature.kelvinText:
            var conValue = Equations.Temperature.kelvin(toCelsious: value)
            updateTextField(tag: ViewTags.Temperature.celsiusText, value: conValue)
            
            conValue = Equations.Temperature.kelvin(toFahrenheit: value)
            updateTextField(tag: ViewTags.Temperature.fahrenheitText, value: conValue)
            
        default:
            break
        }
    }
    
    override func textFields() -> [Int] {
        return ViewTags.Temperature.temperatureTexts
    }
    
    // MARK: Save model
    
    override func onSaveButtonPressed() {
        let tempEquation = Equations.Temperature(celsius: getTextFieldValue(from: ViewTags.Temperature.celsiusText),
                                                 fahrenheit: getTextFieldValue(from: ViewTags.Temperature.fahrenheitText),
                                                 kelvin: getTextFieldValue(from: ViewTags.Temperature.kelvinText))
        
        EquationsStoreManager.insert(tempEquation)
        AlertManager.showSaveAlert(self)
    }
    
}
