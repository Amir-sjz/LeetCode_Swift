//
//  main.swift
//  LeetCode234
//
//  Created by chengz on 2022/3/17.
//

import Foundation

print("Hello, World!")

//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var arr: [Int] = []
        var p = head
        while p != nil {
            arr.append(p!.val)
            p = p?.next
        }
        
        var left = 0
        var right = arr.count-1
        while left<right {
            if arr[left] != arr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}

