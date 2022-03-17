//
//  main.swift
//  LeetCode215
//
//  Created by chengz on 2022/1/8.
//  215. 数组中的第K个最大元素

/**
 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
 
 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 
 */

import Foundation

print("Hello, World!")

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.count==0 || k == 0 {
            return 0
        }
        var nums = nums
        return quickSort(&nums, 0, nums.count-1, k-1)
    }
    
    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ targetInt: Int) -> Int {
        if left == right {
            return nums[left]
        }
        
        let mid = sort(&nums, left, right)
        if mid == targetInt {
            return nums[mid]
        } else if mid<targetInt {
            return quickSort(&nums, mid+1, right, targetInt)
        } else {
            return quickSort(&nums, left, mid-1, targetInt)
        }
    }
    
    func sort(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let index = Int.random(in: left...right)
        
        var start = left
        for i in left+1...right {
            if nums[i]>nums[left] {
                start += 1
                (nums[start], nums[i]) = (nums[i], nums[start])
            }
        }
        (nums[start], nums[left]) = (nums[left], nums[start])
        
        return start
    }
    
    //    func findKthLargest5(_ nums: [Int], _ k: Int) -> Int {
    //        if nums.count == 0 || k == 0 {
    //            return 0
    //        }
    //
    //        var nums = nums
    //        return quickSort(&nums, 0, nums.count-1, nums.count-k)
    //    }
    //
    //    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ targetIndex: Int) -> Int {
    //        if left == right {
    //            return nums[left]
    //        }
    //
    //        //用分区函数得到的分区点下标
    //        let partitionIndex = randPartition(&nums, left, right)
    //        if partitionIndex == targetIndex {
    //            return nums[partitionIndex] //下标等于目标k直接返回对应的值
    //        } else if partitionIndex < targetIndex {
    //            //继续递归调用，进行划分拆分，目标在右半边区间里继续查找
    //            return quickSort(&nums, partitionIndex+1, right, targetIndex)
    //        } else {
    //            //继续递归调用，进行划分拆分，目标在左半边区间里继续查找
    //            return quickSort(&nums, left, partitionIndex-1, targetIndex)
    //        }
    //    }
    //
    //    //快速排序分区函数
    //    func randPartition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
    //        //随机生成一个点
    //        let randomIndex = Int.random(in: left...right)
    //        //交换两个点的值，将随机生成点的值放到最左边，最前面
    //        (nums[left], nums[randomIndex]) = (nums[randomIndex], nums[left])
    //
    //        var start = left
    //        //循环条件是从left+1开始，而不是left开始，因为left位置的值，即第一个值是前面随机点的值了
    //        for i in left+1...right {
    //            // 当后面的值小于nums[left]时才将该值交换到nums[left]的前面，即随机分区点值的前面
    //            if nums[i] < nums[left] {
    //                //先将start指针往后移动1位，再将小于的分区点的值交换到该位置，即分区点位置后面先跟着一群确定的小于值
    //                start += 1
    //                //交换两个点的值
    //                (nums[start], nums[i]) = (nums[i], nums[start])
    //                //start += 1 //start+=1不能放在交换值的后面
    //            }
    //        }
    //
    //        //最后将开头即第一个的分区目标值交换到对应的所有小于目标值的位置，即前面都大于目标值，后面都小于目标值
    //        (nums[start], nums[left]) = (nums[left], nums[start])
    //
    //        return start
    //    }
    
    func findKthLargest4(_ nums: [Int], _ k: Int) -> Int {
        guard k<=nums.count else {
            return -Int(INT_MAX)
        }
        var arr: [Int] = []
        for x in nums {
            if arr.isEmpty {
                arr.append(x)
            } else {
                for i in (0..<arr.count).reversed() {
                    if x<arr[i] {
                        arr.insert(x, at: i+1)
                        break
                    }
                }
                if x >= arr[0] {
                    arr.insert(x, at: 0)
                }
            }
        }
        
        return arr[k-1]
    }
    
    func findKthLargest3(_ nums: [Int], _ k: Int) -> Int {
        guard k <= nums.count else {
            return -Int(INT_MAX)
        }
        
        var arr: [Int] = []
        
        for x in nums {
            let count = arr.count>k ? k :arr.count
            if count == 0 {
                arr.append(x)
            } else {
                for i in (0..<arr.count).reversed() {
                    if x<arr[i] {
                        arr.insert(x, at: i+1)
                        break
                    }
                }
                if x >= arr[0] {
                    arr.insert(x, at: 0)
                }
            }
        }
        
        
        return arr[k-1]
    }
    
    func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
        guard k<=nums.count else {
            return Int(-INT_MAX)
        }
        var arr: [Int] = []
        for idx in nums {
            let count = arr.count>k ? k : arr.count
            if count == 0 {
                arr.append(nums[0])
            } else {
                for i in (0..<count).reversed() {
                    if arr[i] > idx {
                        arr.insert(idx, at: i+1)
                        break
                    }
                }
                if idx >= arr[0] {
                    arr.insert(idx, at: 0)
                }
            }
            
        }
        
        
        return arr[k-1]
    }
    func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {
        guard k<=nums.count else {
            return Int(-INT_MAX)
        }
        var arr: [Int] = [] // 维护一个存放从大到小排列的数组
        
        for idx in nums { // 遍历数组
            let count = arr.count
            if count == 0 {
                arr.append(idx)
            } else {
                let arrLength = count>k ? k : count
                
                for i in (0..<arrLength).reversed() {
                    if arr[i] > idx {
                        arr.insert(idx, at: i+1)
                        break
                    }
                }
                
                if idx >= arr[0] {
                    arr.insert(idx, at: 0)
                }
            }
        }
        
        
        return arr[k-1]
    }
}

print("\(Solution().findKthLargest([1], 1))")

