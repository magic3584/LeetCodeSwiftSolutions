//
//  216-Combination-Sum-III.swift
//  
//
//  Created by Lugick Wang on 2021/1/23.
//

import Foundation

class Solution {
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var results = [[Int]]()
        let candidates = [1,2,3,4,5,6,7,8,9]
        
        var temp = [Int]()
        backtrack(&results, temp: &temp, candidates: candidates, start: 0, length: k, left: n)

        return results
        
    }
    
    func backtrack(_ results:inout [[Int]],  temp:inout [Int], candidates:[Int], start: Int, length: Int, left: Int) {
        
        if length == 0 {
            if left == 0 {
                results.append(temp)
            }
            return
        }
   
        print("results")
        print(results)
        for i in start..<candidates.count-length {
            temp.append(candidates[i])
            print("i")
            print(i)
            print(candidates[i])
            backtrack(&results, temp: &temp, candidates: candidates, start: i+1, length: length-1,left: left-candidates[i])
            print("后退")
             print(temp)
            temp.removeLast()
             print(temp)
        }
    }
}
