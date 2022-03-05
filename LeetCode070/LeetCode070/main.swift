//
//  main.swift
//  LeetCode070
//
//  Created by chengz on 2022/3/4.
//

import Foundation

print("Hello, World!")


class Solution {
    // 超出时间限制
    func climbStairs(_ n: Int) -> Int {
        if n == 2 {
            return 2
        }
        if n == 1{
            return 1
        }
        var a: Int = 1
        var b: Int = 2
        var temp: Int = 0
        
        for _ in 3...n {
            temp = a + b
            a = b
            b = temp
        }
        return temp
    }
}

print("\(Solution().climbStairs(45))")
