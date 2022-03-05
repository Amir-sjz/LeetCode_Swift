//
//  main.swift
//  LeetCode155
//
//  Created by chengz on 2022/3/5.
//

import Foundation

print("Hello, World!")

class MinStack {

    var min: Int = Int(INT_MAX)
    var stack: [Int]
    /** initialize your data structure here. */
    init() {
        stack = []
    }
    
    func push(_ val: Int) {
        if val <= min {
            stack.append(min)
            min = val
        }
        stack.append(val)
    }
    
    func pop() {
        if let last: Int = stack.popLast() {
            if last == min {
                min = stack.popLast()!
            }
        }
    }
    
    func top() -> Int {
        return stack.last ?? 0
    }
    
    func getMin() -> Int {
        return min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
