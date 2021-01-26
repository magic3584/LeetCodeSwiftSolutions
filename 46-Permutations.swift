//
//  46-Permutations.swift
//  
//
//  Created by Lugick Wang on 2021/1/26.
//

import Foundation

class Solution {
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var temp = [Int]()
        var usedArray = Array(repeating: false, count: nums.count)
        
        dfs(nums, results: &results, depth: 0, temp: &temp, usedArray: &usedArray)
        
        return results
    }
    
    func dfs(_ nums:[Int],results:inout [[Int]], depth:Int, temp:inout [Int], usedArray:inout [Bool]) {
        if depth == nums.count {
            results.append(temp)
//            print("加入结果--\(temp)")
            return
        }
        
        for i in 0..<nums.count {
//            print("i--\(i)--\(usedArray)")
            if !usedArray[i] {
                temp.append(nums[i])
                usedArray[i] = true
                
//                print("\(i)--\(nums[i])--temp--\(temp)")
                
                
                dfs(nums, results: &results, depth: depth+1, temp: &temp, usedArray: &usedArray)
                usedArray[i] = false
                temp.removeLast()
//                print("i--\(i)-remove--\(temp)")

            }
        }
        
    }
}
