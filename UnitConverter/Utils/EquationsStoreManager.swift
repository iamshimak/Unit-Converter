//
//  EquationsStoreManager.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class EquationsStoreManager: NSObject {
    
    static func insert<T: Codable & Auditable>(_ equation: T) {        
        let queue = retrieve(object: T.self) ?? Queue<T>(numberOfSize: 5)
        queue.enqueue(equation)
        save(queue: queue)
    }
    
    static func save<T: Encodable>(_ equation: T) {
        let key = String(describing: T.self)
        UserDefaults.standard.save(customObject: equation, inKey: key)
    }
    
    static func save<T: Codable>(queue: Queue<T>) {
        let key = String(describing: T.self)
        UserDefaults.standard.save(customObject: queue, inKey: key)
    }
    
    static func retrieve<T: Decodable>(object type:T.Type) -> Queue<T>? {
        let key = String(describing: T.self)
        return UserDefaults.standard.retrieve(object: Queue<T>.self, fromKey: key)
    }
}
