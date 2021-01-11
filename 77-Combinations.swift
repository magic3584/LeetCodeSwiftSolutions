//
//  77-Combinations.swift
//  
//
//  Created by Lugick Wang on 2021/1/11.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var results = [[Int]]()
        var candidates = [Int]()
        for i in 1...n {
            candidates.append(i)
        }
        
        var temp = [Int]()
        backtrack(&results, temp: &temp, candidates: candidates, depth: k, start: 0)
        return results
            
    }
    
    func backtrack(_ results:inout [[Int]],  temp:inout [Int], candidates:[Int], depth: Int, start: Int) {

        
        if temp.count == depth {
            results.append(temp)
            return
        }
        
        //剪枝，剩余数量不够就不用再继续了
        let end = candidates.count - (depth - temp.count) + 1
        
        for i in start..<end {
            temp.append(candidates[i])
            // print(candidates[i])
            backtrack(&results, temp: &temp, candidates: candidates, depth: depth, start: i+1)
            // print(temp)
            temp.removeLast()
            // print(temp)
        }
    }
