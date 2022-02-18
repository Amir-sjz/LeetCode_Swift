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
        var maxLength: Int = 0
        var x: Int = 0
        var dict: [Character:Int] = [:]
        
        for (i, char) in s.enumerated() {
            if let pre = dict[char], pre>=x {
                if maxLength<i-x {
                    maxLength = i-x
                }
                x = pre+1
            }
            dict[char] = i
        }
        
        if s.count-x > maxLength {
            maxLength = s.count-x
        }
        
        return maxLength
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var length: Int = 0
        var i: Int = 0 // 左边的坐标
        var dict: [Character: Int] = [:]
        
        for (j, idx) in s.enumerated() {
            if let pre = dict[idx], pre>=i {
                if j-i > length {
                    length = j-i
                }
                i = pre+1
            }
            dict[idx] = j
        }
        
        if length < s.count-i {
            length = s.count-i
        }
        
        
        return length
    }
    
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
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
