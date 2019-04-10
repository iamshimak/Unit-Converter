//
//  WeightUnitsViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/26/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class WeightUnitsViewController: UnitsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Textfield Delegates
    
    override func textfield(value: Float,for tag: Int) {
        print("Value: \(value) Tag: \(tag)")
        switch tag {
        case ViewTags.Weight.ounceText:
            var conValue = Equations.Weight.ounce(toPounds: value)
            updateTextField(tag: ViewTags.Weight.poundText, value: conValue)
            
            conValue = Equations.Weight.ounce(toKg: value)
            updateTextField(tag: ViewTags.Weight.kgText, value: conValue)
            
            conValue = Equations.Weight.ounce(toGrams: value)
            updateTextField(tag: ViewTags.Weight.gramText, value: conValue)
            
            conValue = Equations.Weight.ounce(toStones: value)
            updateTextField(tag: ViewTags.Weight.stonesText, value: conValue)
            
        case ViewTags.Weight.poundText:
            var conValue = Equations.Weight.pound(toOunce: value)
            updateTextField(tag: ViewTags.Weight.ounceText, value: conValue)
            
            conValue = Equations.Weight.pound(toKg: value)
            updateTextField(tag: ViewTags.Weight.kgText, value: conValue)
            
            conValue = Equations.Weight.pound(toGram: value)
            updateTextField(tag: ViewTags.Weight.gramText, value: conValue)
            
            conValue = Equations.Weight.pound(toStones: value)
            updateTextField(tag: ViewTags.Weight.stonesText, value: conValue)
            
        case ViewTags.Weight.kgText:
            var conValue = Equations.Weight.kg(toOunce: value)
            updateTextField(tag: ViewTags.Weight.ounceText, value: conValue)
            
            conValue = Equations.Weight.kg(toPounds: value)
            updateTextField(tag: ViewTags.Weight.poundText, value: conValue)
            
            conValue = Equations.Weight.kg(toGrams: value)
            updateTextField(tag: ViewTags.Weight.gramText, value: conValue)
            
            conValue = Equations.Weight.kg(toStones: value)
            updateTextField(tag: ViewTags.Weight.stonesText, value: conValue)
            
        case ViewTags.Weight.gramText:
            var conValue = Equations.Weight.gram(toOunce: value)
            updateTextField(tag: ViewTags.Weight.ounceText, value: conValue)
            
            conValue = Equations.Weight.gram(toPound: value)
            updateTextField(tag: ViewTags.Weight.poundText, value: conValue)
            
            conValue = Equations.Weight.gram(toKg: value)
            updateTextField(tag: ViewTags.Weight.kgText, value: conValue)
            
            conValue = Equations.Weight.gram(toStones: value)
            updateTextField(tag: ViewTags.Weight.stonesText, value: conValue)
            
        case ViewTags.Weight.stonesText:
            var conValue = Equations.Weight.stone(toOunce: value)
            updateTextField(tag: ViewTags.Weight.ounceText, value: conValue)
            
            conValue = Equations.Weight.stones(toPound: value)
            updateTextField(tag: ViewTags.Weight.poundText, value: conValue)
            
            conValue = Equations.Weight.stones(toKg: value)
            updateTextField(tag: ViewTags.Weight.kgText, value: conValue)
            
            conValue = Equations.Weight.stones(toGrams: value)
            updateTextField(tag: ViewTags.Weight.gramText, value: conValue)
            
        default:
            break
        }
    }
    
    override func textFields() -> [Int] {
        return ViewTags.Weight.weightTexts
    }
    
    // MARK: Save model
    
    override func onSaveButtonPressed() {
        let weightEquation = Equations.Weight(ounce: getTextFieldValue(from: ViewTags.Weight.ounceText),
                                              pound: getTextFieldValue(from: ViewTags.Weight.poundText),
                                              kg: getTextFieldValue(from: ViewTags.Weight.kgText),
                                              gram: getTextFieldValue(from: ViewTags.Weight.gramText),
                                              stone: getTextFieldValue(from: ViewTags.Weight.stonesText))
        EquationsStoreManager.save(weightEquation)
        AlertManager.showSaveAlert(self)
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
