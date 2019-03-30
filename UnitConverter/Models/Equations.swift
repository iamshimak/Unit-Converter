//
//  Equations.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/28/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class Equations: Codable {
    
    class Weight: Codable {
        let ounce: Float
        let pound: Float
        let kg: Float
        let gram: Float
        let stone: Float
        
        init(ounce: Float, pound: Float, kg: Float, gram: Float, stone: Float) {
            self.ounce = ounce
            self.pound = pound
            self.kg = kg
            self.gram = gram
            self.stone = stone
        }
    }
    
    class Length: Codable {
        
    }
}

extension Equations.Weight {
    //TODO stones
    static func ounce(toPounds value: Float) -> Float {
        return value / 16
    }
    
    static func ounce(toKg value: Float) -> Float {
        return value * 0.02834952
    }
    
    static func ounce(toGrams value: Float) -> Float {
        return value * 28.34952
    }
    
    static func pound(toOunce value: Float) -> Float {
        return value * 16
    }
    
    static func pound(toKg value: Float) -> Float {
        return value * 0.45359237
    }
    
    static func pound(toGram value: Float) -> Float {
        return value * 453.59237
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
    
    static func gram(toOunce value: Float) -> Float {
        return value / 28.34952
    }
    
    static func gram(toPound value: Float) -> Float {
        return value / 453.59237
    }
    
    static func gram(toKg value: Float) -> Float {
        return value / 1000
    }
}
