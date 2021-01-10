//
//  40combination-sum-ii.swift
//  
//
//  Created by Lugick Wang on 2021/1/10.
//

import Foundation

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        var results = [[Int]]()
        let sorted = candidates.sorted()
        var temp = [Int]()
        
        backtrack(&results, temp: &temp, candidates: sorted, remain: target, start: 0)
        return results
    }
    
    func backtrack(_ results:inout [[Int]],  temp:inout [Int], candidates:[Int], remain: Int, start:Int) {
        print("remain--\(remain), start--\(start)")
        if remain < 0 {
            return
        }
        if remain == 0 {
            results.append(temp)
            return
        }
        
        for i in start..<candidates.count {
            // 与 39 题多了一个去重的操作
            if i > start && candidates[i] == candidates[i-1] {
                continue
            }
            temp.append(candidates[i])
            print(candidates[i])
            backtrack(&results, temp: &temp, candidates: candidates, remain: remain-candidates[i], start: i+1)
            print(temp)
            temp.removeLast()
            print(temp)
        }
    }
}
