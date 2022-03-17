//
//  main.swift
//  LeetCode543
//
//  Created by chengz on 2022/3/7.
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
    var maxD: Int = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        maxD = 0
        depth(root)
        return maxD
    }
    func depth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = depth(root?.left)
        let right = depth(root?.right)
        maxD = max(maxD, left + right)
        return max(left, right) + 1
    }
}

let left = TreeNode(2)
let right = TreeNode(3)
let root = TreeNode(1)
root.left = left
root.right = right

print("\(Solution().diameterOfBinaryTree(root))")
