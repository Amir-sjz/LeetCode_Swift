//
//  main.swift
//  LeetCode003
//
//  Created by chengz on 2022/1/6.
//

import Foundation

print("Hello, World!")

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length: Int = 0
        var x: Int = 0 // 取的字符串最左边的坐标
        var dict: [Character: Int] = [:]
        
        for (i, char) in s.enumerated() {
            if let pre: Int = dict[char], pre > x { // 取出当前字符在上一个的位置  并且 取出的字符比x大
                
                if length<(i-x-1) {
                    length = i-x-1
                }
                x = pre + 1
            }
            dict[char] = i // 赋值新的值
        }
        
        if s.count - x - 1 > length {
            length = s.count - x - 1
        }
        return length
    }
}

print("\(Solution().lengthOfLongestSubstring("abcaebcdbyjkmgb"))")
