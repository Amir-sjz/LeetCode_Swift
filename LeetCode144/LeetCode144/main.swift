//
//  main.swift
//  LeetCode144
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
    func preorderTraversal3(_ root: TreeNode?) -> [Int] {
        var list: [Int] = []
        var stack: [TreeNode] = []
        var root = root
        
        while root != nil || !stack.isEmpty {
            // 逮住一个单列的
            while root != nil {
                stack.append(root!)
                list.append(root!.val)
                root = root?.left
            }
            
            root = stack.popLast()
            root = root?.right
        }
        
        return list
    }
    
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        var list: [Int] = []
        var stack: [TreeNode] = []
        var root = root
        
        while root != nil || !stack.isEmpty {
            while root != nil {
                stack.append(root!)
                list.append(root!.val)
                root = root?.left
            }
            root = stack.popLast()
            root = root?.right
        }
        return list
    }
    
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        var list: [Int] = []
        
        preorder(r: root, arr: &list)
        return list
    }
    
    fileprivate func preorder(r: TreeNode?, arr: inout [Int]){
        arr.append(r!.val)
        preorder(r: r?.left, arr: &arr)
        preorder(r: r?.right, arr: &arr)
    }
    
    
    
    
    func preorderTraversal0(_ root: TreeNode?) -> [Int] {
        var root = root
        var list: [Int] = []
        var stack: [TreeNode] = []
        var pre: TreeNode? // 上一个弹出的节点，判断是不是当前的右节点
        
        while root != nil || !stack.isEmpty {
            while root != nil {
                stack.append(root!)
                
                // 打印前序
                list.append(root!.val) // 前序
                
                root = root?.left
            }
            
            root = stack.last
            
            //                list.append(root!.val) // 中序
            
            if root?.right == nil {
                stack.removeLast()
                //                    list.append(root!.val) // 后序
                pre = root // 刚移除的设置为pre
                root = nil
            } else {
                if root?.right === pre { // 可以和上面的判断合并（root?.right == nil || root?.right === pre） （为了方便理解，这里先不合并了）
                    stack.removeLast()
                    //                        list.append(root!.val) // 后序
                    pre = root // 刚移除的设置为pre
                    root = nil
                } else {
                    root = root?.right
                }
            }
        }
        
        return list
    }
}
