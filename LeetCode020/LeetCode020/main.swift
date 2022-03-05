//
//  main.swift
//  LeetCode020
//
//  Created by chengz on 2022/3/4.
//

import Foundation

print("Hello, World!")

class Solution {
    func isValid(_ s: String) -> Bool {
        var arr: [Character] = []
        var lastC: Character?
        s.forEach { (c) in
            if c == ")", lastC == "(" {
                arr.removeLast()
            } else if c == "]", lastC == "[" {
                arr.removeLast()
            } else if c == "}", lastC == "{" {
                arr.removeLast()
            } else {
                arr.append(c)
            }
            
            lastC = arr.last
        }
        
        if arr.count == 0 {
            return true
        }
        return false
    }
}
