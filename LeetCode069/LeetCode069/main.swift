//
//  main.swift
//  LeetCode069
//
//  Created by chengz on 2022/3/4.
//

import Foundation

print("Hello, World!")

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var l: Int = 0, r: Int = x, ans = 0
        while l<=r {
            let mid = l + (r-l)/2
            if mid*mid <= x {
                ans = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans
    }
    
    
    func mySqrt0(_ x: Int) -> Int {
        var l: Int = 0, r: Int = x, ans: Int = -1
        while l<=r {
            let mid = l+(r-l)/2
            if mid*mid<=x {
                ans = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans
    }
}
