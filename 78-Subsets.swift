//
//  78-Subsets.swift
//  
//
//  Created by Lugick Wang on 2021/1/19.
//

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        let candidates = nums.sorted()
        
        var temp = [Int]()
        backtrack(&results, temp: &temp, candidates: candidates, start: 0)

        return results
        
    }
    
    func backtrack(_ results:inout [[Int]],  temp:inout [Int], candidates:[Int], start: Int) {
        
        results.append(temp)
        print("results")
        print(results)
        for i in start..<candidates.count {
            temp.append(candidates[i])
            print("i")
            print(i)
            print(candidates[i])
            backtrack(&results, temp: &temp, candidates: candidates, start: i+1)
            print("后退")
             print(temp)
            temp.removeLast()
             print(temp)
        }
    }
}
