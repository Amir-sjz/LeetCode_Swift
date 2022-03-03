//
//  main.swift
//  LeetCode415
//
//  Created by chengz on 2022/3/2.
//

import Foundation

print("Hello, World!")
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var sum: String = ""
        let arr1 = Array(num1)
        let arr2 = Array(num2)
        
        var end1 = arr1.count - 1
        var end2  = arr2.count - 1
        var add: Int = 0
        while end1 >= 0 || end2 >= 0 {
            let c1 = end1>=0 ? arr1[end1] : "0"
            let c2 = end2>=0 ? arr2[end2] : "0"
            
            let s = (Int(String(c1)) ?? 0) + (Int(String(c2)) ?? 0) + add
            add = 0 // 进位归零
            
            if s < 10 {
                sum = "\(s)" + sum
            } else {
                sum = "\(s%10)" + sum
                add = 1
            }
            
            end1 -= 1
            end2 -= 1
        }
        
        if add>0 {
            sum = "1" + sum
        }
        return sum
    }
}
