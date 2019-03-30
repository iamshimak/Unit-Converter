//
//  EquationsStoreManager.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class EquationsStoreManager: NSObject {
    
    static func save<T: Encodable>(_ equation: T) {
        let key = String(describing: T.self)
        UserDefaults.standard.save(customObject: equation, inKey: key)
    }
    
    static func retrieve<T: Decodable>(object type:T.Type) -> T? {
        let key = String(describing: T.self)
        return UserDefaults.standard.retrieve(object: T.self, fromKey: key)
    }
}
