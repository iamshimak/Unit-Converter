//
//  LiquidViewController.swift
//  UnitConverter
//
//  Created by student on 4/3/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class LiquidViewController: UnitsViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupKeyBoard(scrollView)
    }
    
    // MARK: Textfield Delegates
    
    override func textfield(value: Float,for tag: Int) {
        //TODO check an easy way
        print("Value: \(value) Tag: \(tag)")
        switch tag {
        case ViewTags.Liquid.gallonText:
            var conValue = Equations.Liquid.gallon(toLitre: value)
            updateTextField(tag: ViewTags.Liquid.litreText, value: conValue)
            
            conValue = Equations.Liquid.gallon(toPint: value)
            updateTextField(tag: ViewTags.Liquid.pintText, value: conValue)
            
            conValue = Equations.Liquid.gallon(toOunce: value)
            updateTextField(tag: ViewTags.Liquid.ounceText, value: conValue)
            
            conValue = Equations.Liquid.gallon(toMilliliter: value)
            updateTextField(tag: ViewTags.Liquid.milliliterText, value: conValue)
            
        case ViewTags.Liquid.litreText:
            var conValue = Equations.Liquid.liter(toGallon: value)
            updateTextField(tag: ViewTags.Liquid.gallonText, value: conValue)
            
            conValue = Equations.Liquid.liter(toPint: value)
            updateTextField(tag: ViewTags.Liquid.pintText, value: conValue)
            
            conValue = Equations.Liquid.liter(toOunce: value)
            updateTextField(tag: ViewTags.Liquid.ounceText, value: conValue)
            
            conValue = Equations.Liquid.liter(toMilliliter: value)
            updateTextField(tag: ViewTags.Liquid.milliliterText, value: conValue)
            
        case ViewTags.Liquid.pintText:
            var conValue = Equations.Liquid.pint(toGallon: value)
            updateTextField(tag: ViewTags.Liquid.gallonText, value: conValue)
            
            conValue = Equations.Liquid.pint(toLitre: value)
            updateTextField(tag: ViewTags.Liquid.litreText, value: conValue)
            
            conValue = Equations.Liquid.pint(toOunce: value)
            updateTextField(tag: ViewTags.Liquid.ounceText, value: conValue)
            
            conValue = Equations.Liquid.pint(toMillilitre: value)
            updateTextField(tag: ViewTags.Liquid.milliliterText, value: conValue)
            
        case ViewTags.Liquid.ounceText:
            var conValue = Equations.Liquid.ounce(toGallon: value)
            updateTextField(tag: ViewTags.Liquid.gallonText, value: conValue)
            
            conValue = Equations.Liquid.ounce(toLitre: value)
            updateTextField(tag: ViewTags.Liquid.litreText, value: conValue)
            
            conValue = Equations.Liquid.ounce(toPint: value)
            updateTextField(tag: ViewTags.Liquid.pintText, value: conValue)
            
            conValue = Equations.Liquid.ounce(toMillilitre: value)
            updateTextField(tag: ViewTags.Liquid.milliliterText, value: conValue)
            
        case ViewTags.Liquid.milliliterText:
            var conValue = Equations.Liquid.millilitre(toGallon: value)
            updateTextField(tag: ViewTags.Liquid.gallonText, value: conValue)
            
            conValue = Equations.Liquid.millilitre(toOunce: value)
            updateTextField(tag: ViewTags.Liquid.ounceText, value: conValue)
            
            conValue = Equations.Liquid.millilitre(toPint: value)
            updateTextField(tag: ViewTags.Liquid.pintText, value: conValue)
            
            conValue = Equations.Liquid.millilitre(toLitre: value)
            updateTextField(tag: ViewTags.Liquid.litreText, value: conValue)
        default:
            break
        }
    }
    
    // MARK: Save model
    
    override func onSaveButtonPressed() {
        let weightEquation = Equations.Weight(ounce: getTextFieldValue(from: ViewTags.Weight.ounceText),
                                              pound: getTextFieldValue(from: ViewTags.Weight.poundText),
                                              kg: getTextFieldValue(from: ViewTags.Weight.kgText),
                                              gram: getTextFieldValue(from: ViewTags.Weight.gramText),
                                              stone: getTextFieldValue(from: ViewTags.Weight.stonesText))
        EquationsStoreManager.save(weightEquation)
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
