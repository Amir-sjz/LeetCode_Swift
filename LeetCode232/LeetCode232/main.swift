//
//  main.swift
//  LeetCode232
//
//  Created by chengz on 2022/3/2.
//

import Foundation

print("Hello, World!")

class MyQueue {
    var s1: [Int]
    var s2: [Int]
    var font: Int?

    init() {
        s1 = []
        s2 = []
    }
    
    func push(_ x: Int) {
        if s1.isEmpty {
            font = x
        }
        s1.append(x)
    }
    
    func pop() -> Int {
        if s2.isEmpty {
            while !s1.isEmpty {
                s2.append(s1.popLast()!)
            }
        }
        return s2.popLast() ?? -1
    }
    
    func peek() -> Int {
        if s2.isEmpty {
            return font ?? -1
        }
        return s2.last!
    }
    
    func empty() -> Bool {
        return s1.isEmpty && s2.isEmpty
    }
}
