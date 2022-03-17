//
//  main.swift
//  LeetCode083
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var dict: [Int: ListNode] = [:]
        
        var pre = head
        var p = head?.next
        if head != nil {
            dict[head!.val] = head
        }
        while p != nil {
            if let _ = dict[p!.val] {
                // 移除这个元素
                let next = p?.next
                pre?.next = next
                p = next
            } else {
                pre = p
                dict[p!.val] = p
                p = p?.next
            }
        }
        return head
    }
}
