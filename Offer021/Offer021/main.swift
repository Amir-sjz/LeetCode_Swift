//
//  main.swift
//  Offer021
//
//  Created by chengz on 2022/3/12.
//

import Foundation

print("Hello, World!")

class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        var p1 = 0
        var p2 = nums.count-1
        var nums = nums
        while p1<p2 {
            let left = nums[p1]
            let right = nums[p2]
            if left%2 == 0 && right%2 == 1 {
                (nums[p1], nums[p2]) = (nums[p2], nums[p1])
            } else if left%2 == 1 && right%2 == 1{
                p1 += 1
            } else if left%2 == 0 && right%2 == 0{
                p2 -= 1
            } else {
                p1 += 1
                p2 -= 1
            } 
        }
        return nums
    }
}
