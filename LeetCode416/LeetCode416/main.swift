//
//  main.swift
//  LeetCode416
//
//  Created by chengz on 2022/1/19.
//  LRU缓存

/**
 请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。
 实现 LRUCache 类：
 LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存
 int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
 void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。
 函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。
 */

import Foundation

print("Hello, World!")

class Node {
    var key: Int = 0
    var val: Int = 0
    var pre: Node?
    var next: Node?
    init(_ key: Int = 0, _ value: Int = 0) {
        self.val = value
        self.key = key
    }
}


class LRUCache {
    
    var map: [Int: XMLNode]

    init(_ capacity: Int) {
        // 数组+字典

    }
    
    func get(_ key: Int) -> Int {
        // 直接从字典里面取，更新到最新位置
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        // 看是否存在，如果存在直接替换
        // 如果不存在，看是否满了，把最久的元素从数组挤出，从字典里面置为nil
        // 如果不满，直接赋值，更新长度

    }
    
    
    // 双向链表的添加删除
    private func removeNode(_ node: Node) {
        
    }
    private func addNode(_ node: Node) {
        
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
