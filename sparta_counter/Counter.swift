//
//  Counter.swift
//  sparta_counter
//
//  Created by Seol WooHyeok on 2/10/25.
//

import Foundation

class Counter {
    private var count: Int = 0
    
    func increment() {
        self.count += 1
    }
    
    func decrement() {
        self.count -= 1
    }
    
    func reset() {
        self.count = 0
    }
    
    func getCount() -> Int {
        return self.count
    }
}
