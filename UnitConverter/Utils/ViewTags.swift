//
//  ViewTags.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class ViewTags {
    
    class Weight {
        static let ounceText: Int = 1000
        static let poundText: Int = 1001
        static let kgText: Int = 1002
        static let gramText: Int = 1003
        static let stonesText: Int = 1004
        static let sPoundText: Int = 1005
        
        static let weightTexts: [Int] = [1000, 1001, 1002, 1003, 1004, 1005]
    }
    
    class Temperature {
        static let celsiusText: Int = 2000
        static let fahrenheitText: Int = 2001
        static let kelvinText: Int = 2002
        
        static let temperatureTexts: [Int] = [2000, 2001, 2002]
    }
    
    class Length {
        static let meterText: Int = 3000
        static let mileText: Int = 3001
        static let cmText: Int = 3002
        static let mmText: Int = 3003
        static let yardText: Int = 3004
        static let inchText: Int = 3005
        
        static let lengthTexts: [Int] = [3000, 3001, 3002, 3003, 3004, 3005]
    }
    
    class Speed {
        static let metersInSecText: Int = 4000
        static let kmInHourText: Int = 4001
        static let milesInHourText: Int = 4002
        static let nauticalMilesInHourText: Int = 4003
        
        static let speedTexts: [Int] = [4000, 4001, 4002, 4003]
    }
    
    class Liquid {
        static let gallonText: Int = 5000
        static let litreText: Int = 5001
        static let pintText: Int = 5002
        static let ounceText: Int = 5003
        static let milliliterText: Int = 5004
        
        static let liquidTexts: [Int] = [5000, 5001, 5002, 5003, 5004]
    }
}
