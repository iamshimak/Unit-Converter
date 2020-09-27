//
//  Equations.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/28/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

protocol Auditable {
    var savedDate: Date { get }
}

class Equations: Codable {
    
    class Weight: Auditable, Codable {
        let ounce: Float
        let pound: Float
        let kg: Float
        let gram: Float
        let stones: Float
        let stone_pounds: Float
        
        let savedDate: Date
        
        init(ounce: Float, pound: Float, kg: Float, gram: Float, stones: Float, stone_pounds: Float) {
            self.ounce = ounce
            self.pound = pound
            self.kg = kg
            self.gram = gram
            self.stones = stones
            self.stone_pounds = stone_pounds
            
            self.savedDate = Date()
        }
    }
    
    class Length: Auditable, Codable {
        let meter: Float
        let mile: Float
        let cm: Float
        let mm: Float
        let yard: Float
        let inch: Float
        
        let savedDate: Date
        
        init(meter: Float, mile: Float, cm: Float, mm: Float, yard: Float, inch: Float) {
            self.meter = meter
            self.mile = mile
            self.cm = cm
            self.mm = mm
            self.yard = yard
            self.inch = inch
            
            self.savedDate = Date()
        }
    }
    
    class Liquid: Auditable, Codable {
        let gallon: Float
        let litre: Float
        let pint: Float
        let ounce: Float
        let milliliter: Float
        
        let savedDate: Date
        
        init(gallon: Float, litre: Float, pint: Float, ounce: Float, milliliter: Float) {
            self.gallon = gallon
            self.litre = litre
            self.pint = pint
            self.ounce = ounce
            self.milliliter = milliliter
            
            self.savedDate = Date()
        }
    }
    
    class Temperature: Auditable, Codable {
        let celsius: Float
        let fahrenheit: Float
        let kelvin: Float
        
        let savedDate: Date
        
        init(celsius: Float, fahrenheit: Float, kelvin: Float) {
            self.celsius = celsius
            self.fahrenheit = fahrenheit
            self.kelvin = kelvin
            
            self.savedDate = Date()
        }
    }
    
    class Speed: Auditable, Codable {
        let metersInSec: Float
        let kmInHour: Float
        let milesInHour: Float
        let nauticalMilesInHour: Float
        
        let savedDate: Date
        
        init(metersInSec: Float, kmInHour: Float, milesInHour: Float, nauticalMilesInHour: Float) {
            self.metersInSec = metersInSec
            self.kmInHour = kmInHour
            self.milesInHour = milesInHour
            self.nauticalMilesInHour = nauticalMilesInHour
            
            self.savedDate = Date()
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
    
    static func ounce(toStones value: Float) -> (Float, Float) {
        return toStoneAndPounds(value / 224)
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
    
    static func pound(toStones value: Float) -> (Float, Float) {
        return toStoneAndPounds(value / 14)
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
    
    static func kg(toStones value: Float) -> (Float, Float) {
        return toStoneAndPounds(value / 6.35029318)
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
    
    static func gram(toStones value: Float) -> (Float, Float) {
        return toStoneAndPounds(value / 6350.29318)
    }
    
    static func stone(toOunce stone: Float, poundVal: Float) -> Float {
        return stone * 224 + pound(toOunce: poundVal)
    }
    
    static func stones(toPound stone: Float, poundVal: Float) -> Float {
        return stone * 14 + poundVal
    }
    
    static func stones(toKg stone: Float, poundVal: Float) -> Float {
        return stone * 6.35029318 + pound(toKg: poundVal)
    }
    
    static func stones(toGrams stone: Float, poundVal: Float) -> Float {
        return stone * 6350.29318 + pound(toGram: poundVal)
    }
    
    static func toStoneAndPounds(_ value: Float) -> (Float, Float) {
        return (floor(value), value.truncatingRemainder(dividingBy: 1) * 14)
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

extension Equations.Liquid {
    // TODO check the equation again
    static func gallon(toLitre value: Float) -> Float {
        return value * 3.785412
    }
    
    static func gallon(toPint value: Float) -> Float {
        return value *  6.66139
    }
    
    static func gallon(toOunce value: Float) -> Float {
        return value * 128
    }
    
    static func gallon(toMilliliter value: Float) -> Float {
        return value * 3785.41
    }
    
    static func liter(toGallon value: Float) -> Float {
        return value / 3.785412
    }
    
    static func liter(toPint value: Float) -> Float {
        return value * 1.75975
    }
    
    static func liter(toOunce value: Float) -> Float {
        return value * 33.814
    }
    
    static func liter(toMilliliter value: Float) -> Float {
        return value * 1000
    }
    
    static func pint(toGallon value: Float) -> Float {
        return value / 8
    }
    
    static func pint(toLitre value: Float) -> Float {
        return value / 1.75
    }
    
    static func pint(toOunce value: Float) -> Float {
        return value * 20
    }
    
    static func pint(toMillilitre value: Float) -> Float {
        return value * 473.176473
    }
    
    static func ounce(toGallon value: Float) -> Float {
        return value / 160
    }
    
    static func ounce(toLitre value: Float) -> Float {
        return value / 35.195
    }
    
    static func ounce(toPint value: Float) -> Float {
        return value / 20
    }
    
    static func ounce(toMillilitre value: Float) -> Float {
        return value * 28.413
    }
    
    static func millilitre(toGallon value: Float) -> Float {
        return value / 4546.09
    }
    
    static func millilitre(toLitre value: Float) -> Float {
        return value / 1000
    }
    
    static func millilitre(toPint value: Float) -> Float {
        return value / 568.261
    }
    
    static func millilitre(toOunce value: Float) -> Float {
        return value / 568.261
    }
}

extension Equations.Temperature {
    static func celsious(toFahrenheit value: Float) -> Float {
        return (value * 9/5) + 32
    }
    
    static func celsious(toKelvin value: Float) -> Float {
        return value + 273.15
    }
    
    static func fahrenheit(toCelsious value: Float) -> Float {
        return (value - 32) * 5/9
    }
    
    static func fahrenheit(toKelvin value: Float) -> Float {
        return (value - 32) * 5/9 + 273.15
    }
    
    static func kelvin(toCelsious value: Float) -> Float {
        return value - 273.15
    }
    
    static func kelvin(toFahrenheit value: Float) -> Float {
        return (value - 273.15) * 9/5 + 32
    }
}

extension Equations.Speed {
    static func metersInSec(toKmInHour value: Float) -> Float {
        return value * 3.6
    }
    
    static func metersInSec(toMilesInHour value: Float) -> Float {
        return value * 2.237
    }
    
    static func metersInSec(toNauticalMilesInHour value: Float) -> Float {
        return value * 1.9438612860586
    }
    
    static func kmInHour(toMetersInSec value: Float) -> Float {
        return value / 3.6
    }
    
    static func kmInHour(toMilesInHour value: Float) -> Float {
        return value / 1.609344
    }
    
    static func kmInHour(toNauticalMilesInHour value: Float) -> Float {
        return value / 1.852
    }
    
    static func milesInHour(toMetersInSec value: Float) -> Float {
        return value / 2.237
    }
    
    static func milesInHour(toKmHour value: Float) -> Float {
        return value * 1.609344
    }
    
    static func milesInHour(toNauticalMilesInHour value: Float) -> Float {
        return value / 1.1507794480235
    }
    
    static func nauticalMilesInHour(toMetersInSec value: Float) -> Float {
        return value / 1.9438612860586
    }
    
    static func nauticalMilesInHour(toKmInHour value: Float) -> Float {
        return value * 1.852
    }
    
    static func nauticalMilesInHour(toMilesInHour value: Float) -> Float {
        return value * 1.1507794480235
    }
}
