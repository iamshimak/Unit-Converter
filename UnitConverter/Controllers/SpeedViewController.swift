//
//  SpeedViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 4/10/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class SpeedViewController: UnitsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Textfield Delegates
    
    override func textfield(value: Float,for tag: Int) {
        print("Value: \(value) Tag: \(tag)")
        switch tag {
        case ViewTags.Speed.metersInSecText:
            var conValue = Equations.Speed.metersInSec(toKmInHour: value)
            updateTextField(tag: ViewTags.Speed.kmInHourText, value: conValue)
            
            conValue = Equations.Speed.metersInSec(toMilesInHour: value)
            updateTextField(tag: ViewTags.Speed.milesInHourText, value: conValue)
            
            conValue = Equations.Speed.metersInSec(toNauticalMilesInHour: value)
            updateTextField(tag: ViewTags.Speed.nauticalMilesInHourText, value: conValue)
            
        case ViewTags.Speed.kmInHourText:
            var conValue = Equations.Speed.kmInHour(toMetersInSec: value)
            updateTextField(tag: ViewTags.Speed.metersInSecText, value: conValue)
            
            conValue = Equations.Speed.kmInHour(toMilesInHour: value)
            updateTextField(tag: ViewTags.Speed.milesInHourText, value: conValue)
            
            conValue = Equations.Speed.kmInHour(toNauticalMilesInHour: value)
            updateTextField(tag: ViewTags.Speed.nauticalMilesInHourText, value: conValue)
            
        case ViewTags.Speed.milesInHourText:
            var conValue = Equations.Speed.milesInHour(toMetersInSec: value)
            updateTextField(tag: ViewTags.Speed.metersInSecText, value: conValue)
            
            conValue = Equations.Speed.milesInHour(toKmHour: value)
            updateTextField(tag: ViewTags.Speed.kmInHourText, value: conValue)
            
            conValue = Equations.Speed.milesInHour(toNauticalMilesInHour: value)
            updateTextField(tag: ViewTags.Speed.nauticalMilesInHourText, value: conValue)
            
        case ViewTags.Speed.nauticalMilesInHourText:
            var conValue = Equations.Speed.nauticalMilesInHour(toMetersInSec: value)
            updateTextField(tag: ViewTags.Speed.metersInSecText, value: conValue)
            
            conValue = Equations.Speed.nauticalMilesInHour(toMilesInHour: value)
            updateTextField(tag: ViewTags.Speed.milesInHourText, value: conValue)
            
            conValue = Equations.Speed.nauticalMilesInHour(toKmInHour: value)
            updateTextField(tag: ViewTags.Speed.kmInHourText, value: conValue)
            
        default:
            break
        }
    }
    
    override func textFields() -> [Int] {
        return ViewTags.Speed.speedTexts
    }
    
    // MARK: Save model
    
    override func onSaveButtonPressed() {
        let speedEquation = Equations.Speed.init(metersInSec: getTextFieldValue(from: ViewTags.Speed.metersInSecText),
                                                kmInHour: getTextFieldValue(from: ViewTags.Speed.kmInHourText),
                                                milesInHour: getTextFieldValue(from: ViewTags.Speed.milesInHourText),
                                                nauticalMilesInHour: getTextFieldValue(from: ViewTags.Speed.nauticalMilesInHourText))
        EquationsStoreManager.save(speedEquation)
        AlertManager.showSaveAlert(self)
    }

}
