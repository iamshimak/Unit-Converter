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
        let meter: Float
        let mile: Float
        let cm: Float
        let mm: Float
        let yard: Float
        let inch: Float
        
        init(meter: Float, mile: Float, cm: Float, mm: Float, yard: Float, inch: Float) {
            self.meter = meter
            self.mile = mile
            self.cm = cm
            self.mm = mm
            self.yard = yard
            self.inch = inch
        }
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

extension Equations.Length {
    
    static func meter(toMile value: Float) -> Float {
        return value * 0.00062137
    }
    
    static func meter(toCm value: Float) -> Float {
        return value * 100
    }
    
    static func meter(toMm value: Float) -> Float {
        return value * 1000
    }
    
    static func meter(toYard value: Float) -> Float {
        return value * 1.0936
    }
    
    static func meter(toInch value: Float) -> Float {
        return value / 0.0254
    }
    
    static func mile(toMeter value: Float) -> Float {
        return value / 0.00062137
    }
    
    static func mile(toCm value: Float) -> Float {
        return value * 160934.4
    }
    
    static func mile(toMm value: Float) -> Float {
        return value * 1609344
    }
    
    static func mile(toYard value: Float) -> Float {
        return value * 1760
    }
    
    static func mile(toInch value: Float) -> Float {
        return value * 63360
    }
    
    static func cm(toMeter value: Float) -> Float {
        return value * 100
    }
    
    static func cm(toMile value: Float) -> Float {
        return value / 160934.4
    }
    
    static func cm(toMm value: Float) -> Float {
        return value * 10
    }
    
    static func cm(toYard value: Float) -> Float {
        return value / 91.44
    }
    
    static func cm(toInch value: Float) -> Float {
        return value / 2.54
    }
    
    static func mm(toMeter value: Float) -> Float {
        return value / 1000
    }
    
    static func mm(toMile value: Float) -> Float {
        //TODO change
        return value / 0.000001609
    }
    
    static func mm(toCm value: Float) -> Float {
        return value / 10
    }
    
    static func mm(toYard value: Float) -> Float {
        return value / 914.4
    }
    
    static func mm(toInch value: Float) -> Float {
        return value / 25.4
    }
    
    static func yard(toMeter value: Float) -> Float {
        return value / 1.0936
    }
    
    static func yard(toMile value: Float) -> Float {
        return value / 1760
    }
    
    static func yard(toCm value: Float) -> Float {
        return value * 91.44
    }
    
    static func yard(toMm value: Float) -> Float {
        return value * 914.4
    }
    
    static func yard(toInch value: Float) -> Float {
        return value * 36
    }
    
    static func inch(toMeter value: Float) -> Float {
        return value / 39.37
    }
    
    static func inch(toMiles value: Float) -> Float {
        return value / 63360
    }
    
    static func inch(toCm value: Float) -> Float {
        return value * 2.54
    }
    
    static func inch(toMm value: Float) -> Float {
        return value * 25.4
    }
    
    static func inch(toYard value: Float) -> Float {
        return value / 36
    }
}
