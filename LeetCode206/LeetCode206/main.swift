//
//  main.swift
//  LeetCode206
//
//  Created by chengz on 2022/1/6.
//

import Foundation



print("Hello, World!")


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

let node1 = ListNode.init(1)
let node2 = ListNode.init(2)
let node3 = ListNode.init(3)
let node4 = ListNode.init(4)

node1.next = node2
node2.next = node3
node3.next = node4



 
class Solution {
    func reverseList(_ head: ListNode?) ->ListNode? {
        var p1 = head
        var p2: ListNode? = nil
        
        while p1 != nil {
            var next = p1?.next
            p1?.next = p2
            p2 = p1
            p1 = next
        }
        
//        while p1?.next != nil { // 差别在哪里？ 回缺失最后一位
//            var next = p1?.next
//            p1?.next = p2
//            p2 = p1
//            p1 = next
//        }
        
        return p2
    }
    
    
    func reverseList3(_ head: ListNode?) -> ListNode? {
        var current = head
        var p: ListNode? = nil
        while current != nil {
            let next = current?.next
            current?.next = p
            p = current
            current = next
        }
        return p
    }
    
    func reverseList2(_ head: ListNode?) -> ListNode? {
        var current = head
        var p: ListNode? = nil
        while current != nil {
            let next = current?.next
            current?.next = p
            p = current
            current = next
        }
        return p
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var p2: ListNode? = nil
        var current = head
        
        while current != nil {
            let next = current?.next // 拿到下一个
            current?.next = p2 // 将指针指到上一个 第一次是nil
            p2 = current // 更新上一个的node
            current = next // 更新当前node
        }
        
        return p2
        
    }
}

Solution().reverseList(node1)
