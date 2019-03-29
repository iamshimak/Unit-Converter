//
//  WeightUnitsViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/26/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class WeightUnitsViewController: UnitsViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupKeyBoard(scrollView)
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
        case ViewTags.Weight.ounceText:
            var conValue = Equations.Weight.ounce(toPounds: value)
            updateTextField(tag: ViewTags.Weight.poundText, value: conValue)
            
            conValue = Equations.Weight.ounce(toKg: value)
            updateTextField(tag: ViewTags.Weight.kgText, value: conValue)
            
            conValue = Equations.Weight.ounce(toGrams: value)
            updateTextField(tag: ViewTags.Weight.gramText, value: conValue)
            
        case ViewTags.Weight.poundText:
            var conValue = Equations.Weight.pound(toOunce: value)
            updateTextField(tag: ViewTags.Weight.ounceText, value: conValue)
            
            conValue = Equations.Weight.pound(toKg: value)
            updateTextField(tag: ViewTags.Weight.kgText, value: conValue)
            
            conValue = Equations.Weight.pound(toGram: value)
            updateTextField(tag: ViewTags.Weight.gramText, value: conValue)
            
        case ViewTags.Weight.kgText:
            var conValue = Equations.Weight.kg(toOunce: value)
            updateTextField(tag: ViewTags.Weight.ounceText, value: conValue)
            
            conValue = Equations.Weight.kg(toPounds: value)
            updateTextField(tag: ViewTags.Weight.poundText, value: conValue)
            
            conValue = Equations.Weight.kg(toGrams: value)
            updateTextField(tag: ViewTags.Weight.gramText, value: conValue)
        case ViewTags.Weight.gramText:
            var conValue = Equations.Weight.gram(toOunce: value)
            updateTextField(tag: ViewTags.Weight.ounceText, value: conValue)
            
            conValue = Equations.Weight.gram(toPound: value)
            updateTextField(tag: ViewTags.Weight.poundText, value: conValue)
            
            conValue = Equations.Weight.gram(toKg: value)
            updateTextField(tag: ViewTags.Weight.kgText, value: conValue)
        default:
            break
        }
    }
    
    func updateTextField(tag: Int, value: Float) {
        let textField : UITextField = self.view.viewWithTag(tag) as! UITextField
        textField.text = String(describing: value)
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
