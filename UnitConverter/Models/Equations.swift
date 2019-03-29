//
//  Equations.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/28/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class Equations: NSObject {
    class Weight {
        static func ounce(toPounds value: Float) -> Float {
            return value / 16
        }
        
        static func ounce(toKg value: Float) -> Float {
            return value * 0.02834952
        }
        
        static func ounce(toGrams value: Float) -> Float {
            return value * 28.34952
        }
        
        static func poundsToOunce(pound: Float) -> Float {
            return pound * 16
        }
        
        static func pounds(toKg value: Float) -> Float {
            return value * 0.45359237
        }
        
        static func gram(toKg value: Float) -> Float {
            return value / 1000
        }
        
        static func kg(toOunce value: Float) -> Float {
            return value / 0.02834952
        }
        
        static func kg(toPounds value: Float) -> Float {
            return value / 0.45359237
        }
        
        static func kg(toGrams value: Float) -> Float {
            return value * 1000
        }
    }
}
