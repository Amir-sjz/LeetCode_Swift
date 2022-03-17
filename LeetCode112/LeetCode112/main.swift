//
//  main.swift
//  LeetCode112
//
//  Created by chengz on 2022/3/12.
//

import Foundation

print("Hello, World!")

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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil {
            return targetSum == root!.val
        }
        return hasPathSum(root?.left, targetSum-root!.val) || hasPathSum(root?.right, targetSum-root!.val)
    }
}
