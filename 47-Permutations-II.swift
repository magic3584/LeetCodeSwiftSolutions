//
//  47-Permutations-II.swift
//  
//
//  Created by Lugick Wang on 2021/1/26.
//

import Foundation

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var temp = [Int]()
        let sorted = nums.sorted()
        var usedArray = Array(repeating: false, count: nums.count)
        
        dfs(sorted, results: &results, depth: 0, temp: &temp, usedArray: &usedArray)
        
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
            //剪枝条件是上一个相同的刚好被撤销了，也就是 false
            if usedArray[i] || (i > 0 && nums[i] == nums[i-1] && usedArray[i-1] == false) {
                continue
            }
            
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
