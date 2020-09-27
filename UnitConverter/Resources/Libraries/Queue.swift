//
//  Queue.swift
//  UnitConverter
//
//  Created by Shimak on 9/27/20.
//  Copyright © 2020 Ahamed Shimak. All rights reserved.
//

import UIKit

public class Queue<T: Codable>: Codable {
    
    private let numberOfSize : Int
    
    private var enqueueStack = [T]();
    private var dequeueStack = [T]();
    
    init(numberOfSize: Int) {
        self.numberOfSize = numberOfSize
    }

    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
    var isFull: Bool {
        return dequeueStack.count + enqueueStack.count >= numberOfSize
    }
    
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    func enqueue(_ element: T) {
        if isFull {
            _ = dequeue()
        }
        
        enqueueStack.append(element)
    }
    
    func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    
    func elements() -> [T] {
        return dequeueStack.isEmpty ? enqueueStack : dequeueStack + enqueueStack
    }
}
