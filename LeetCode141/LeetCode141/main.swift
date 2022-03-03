//
//  main.swift
//  LeetCode141
//
//  Created by chengz on 2022/3/2.
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

extension ListNode: Equatable {
    public static func == (l: ListNode, r: ListNode) -> Bool {
        return l === r
    }
}

extension ListNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class Solution {
    // 使用快慢指针
    func hasCycle(_ head: ListNode?) -> Bool {
        var p1 = head
        var p2 = head?.next
        while p1 != nil && p2 != nil {
            if p1 === p2 {
                return true
            }
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        return false
    }
    
    
    
    
    // 使用字典存值
    func hasCycle0(_ head: ListNode?) -> Bool {
        var p = head
        var set = Set<ListNode>()
        while p != nil {
            if !set.insert(p!).inserted {
                return true
            }
            p = p?.next
        }
        return false
    }
}
