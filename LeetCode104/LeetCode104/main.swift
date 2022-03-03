//
//  main.swift
//  LeetCode104
//
//  Created by chengz on 2022/3/2.
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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var ans: Int = 0
        var arr: [TreeNode] = [root]
        
        while !arr.isEmpty {
            var size = arr.count
            while size > 0 {
                let node = arr.removeFirst()
                if let left = node.left {
                    arr.append(left)
                }
                if let right = node.right {
                    arr.append(right)
                }
                size -= 1
            }
            ans += 1
        }
        
        return ans
    }
    
    
    
    func maxDepth1(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var arr: [TreeNode] = [root!]
        var ans: Int = 0
        while !arr.isEmpty {
            var size = arr.count
            while size > 0 {
                let node = arr.removeFirst()
                if node.left != nil {
                    arr.append(node.left!)
                }
                if node.right != nil {
                    arr.append(node.right!)
                }
                size -= 1
            }
            ans += 1
        }
        
        return ans
    }
    
    func maxDepth0(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
}
