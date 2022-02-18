//
//  main.swift
//  LeetCode160
//
//  Created by chengz on 2022/1/9.
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

func arrToListNode(_ arr: [Int]) -> ListNode? {
    var pre: ListNode? = nil
    var head: ListNode? = nil
    for (i, idx) in arr.enumerated() {
        
        
        let node = ListNode.init(idx)
        node.next = nil
        
        if i==0 {
            head = node
            pre = node
        } else {
            pre?.next = node
            pre = node
        }
    }
    return head
}

func nodeToArr(_ list: ListNode?) -> [Int] {
    var current = list
    var arr: [Int] = []
    
    while current != nil {
        arr.append((current?.val)!)
        current = current?.next
    }
    return arr
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var head1 = headA
        var head2 = headB
        while head1 !== head2 {
            head1 = head1 != nil ? head1?.next : headB
            head2 = head2 != nil ? head2?.next : headA
        }
        return head1
    }
    
    func getIntersectionNode0(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var head1 = headA
        var head2 = headB
        
        while head1 !== head2 {
            head1 = head1==nil ? headB : head1?.next
            head2 = head2==nil ? headA : head2?.next
        }
    
        return head1
    }
    
    
}

print("\(nodeToArr(Solution().getIntersectionNode(arrToListNode([1, 5, 6, 3]), arrToListNode([5, 6, 3]))))")
