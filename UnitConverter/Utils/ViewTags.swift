//
//  ViewTags.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
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
        
        static let weightTexts: [Int] = [1000, 1001, 1002, 1003, 1004]
    }
    
    class Length: Codable {
        static let meterText: Int = 3000
        static let mileText: Int = 3001
        static let cmText: Int = 3002
        static let mmText: Int = 3003
        static let yardText: Int = 3004
        static let inchText: Int = 3005
    }
}
