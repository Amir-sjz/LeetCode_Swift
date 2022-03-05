//
//  main.swift
//  LeetCode101
//
//  Created by chengz on 2022/3/4.
//

import Foundation

print("Hello, World!")

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        if root!.left == nil && root!.right == nil {
            return true
        }
        var queue = [TreeNode?]()
        queue.append(root!.left)
        queue.append(root!.right)
        while queue.count > 0 {
            let left = queue.removeFirst()
            let right = queue.removeFirst()
            if left == nil && right == nil {
                continue
            }
            if (left == nil || right == nil) || (left!.val != right!.val) {
                return false
            }
            queue.append(left?.left)
            queue.append(right?.right)
            queue.append(left?.right)
            queue.append(right?.left)
        }
        return true
    }
    func isSymmetric0(_ root: TreeNode?) -> Bool {
        return check0(left: root, right: root)
    }
    
    func check0(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        return left!.val == right!.val && check(left: left?.left, right: right?.right) && check(left: left?.right, right: right?.left)
    }
}
