//
//  main.swift
//  LeetCode215
//
//  Created by chengz on 2022/1/8.
//  215. 数组中的第K个最大元素

/**
 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。

 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 
 */

import Foundation

print("Hello, World!")

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard k<=nums.count else {
            return Int(-INT_MAX)
        }
        var arr: [Int] = [] // 维护一个存放从大到小排列的数组
        
        for idx in nums { // 遍历数组
            let count = arr.count
            if count == 0 {
                arr.append(idx)
            } else {
                let arrLength = count>k ? k : count
                
                for i in (0..<arrLength).reversed() {
                    if arr[i] > idx {
                        arr.insert(idx, at: i+1)
                        break
                    }
                }
                
                if idx >= arr[0] {
                    arr.insert(idx, at: 0)
                }
            }
        }
        
        
        return arr[k-1]
    }
}

print("\(Solution().findKthLargest([1], 1))")

