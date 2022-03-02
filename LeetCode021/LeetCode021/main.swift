//
//  main.swift
//  LeetCode021
//
//  Created by chengz on 2022/3/1.
//

/*
 21. 合并两个有序链表
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 */

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
    
    //
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        
        let preHead: ListNode? = ListNode(-1)
        var p = preHead
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                p?.next = l1
                l1 = l1?.next
            } else {
                p?.next = l2
                l2 = l2?.next
            }
            p = p?.next
        }
        p?.next = l1 == nil ? l2 : l1
        return preHead?.next
    }
    
    // 递归
    func mergeTwoLists1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        } else if list2 == nil {
            return list2
        } else if list1!.val <= list2!.val {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists(list2?.next, list1)
            return list2
        }
    }
    func mergeTwoLists0(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let _ = list1 else {
            return list2
        }
        
        guard let _ = list2 else {
            return list1
        }
        
        
        var p1 = list1
        var p2 = list2
        
        var list: ListNode? = ListNode(0)
        var p = list
        
        while p1 != nil && p2 != nil {
            if p1!.val <= p2!.val {
                p?.next = ListNode(p1!.val)
                p1 = p1?.next
            } else {
                p?.next = ListNode(p2!.val)
                p2 = p2?.next
            }
            p = p?.next
        }
        
        p?.next = p1 == nil ? p2 : p1
        
        return list?.next
    }
}
