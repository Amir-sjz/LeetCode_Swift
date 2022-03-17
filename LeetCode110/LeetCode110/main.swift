//
//  main.swift
//  LeetCode110
//
//  Created by chengz on 2022/3/6.
//

import Foundation

print("Hello, World!")

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
    func isBalanced(_ root: TreeNode?) -> Bool {
        return height(root: root) >= 0
    }
    func height(root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftH = height(root: root.left)
        if leftH<0 {
            return -1
        }
        let rightH = height(root: root.right)
        if rightH<0 {
            return -1
        }
        
        if abs(leftH-rightH)>1 {
            return -1
        } else {
            return max(leftH, rightH) + 1
        }
    }
    
//    func isBalanced(_ root: TreeNode?) -> Bool {
//        guard let root = root else {
//            return true
//        }
//        let left = isBalanced(root.left)
//        let right = isBalanced(root.right)
//        let height = abs(height(root: root.left)-height(root: root.right))
//        return left && right && height<=1
//    }
//    func height(root: TreeNode?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//        return max(height(root: root.left), height(root: root.right)) + 1
//    }
}
