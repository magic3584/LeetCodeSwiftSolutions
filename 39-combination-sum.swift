//
//  39-combination-sum.swift
//  
//
//  Created by Lugick Wang on 2021/1/8.
//  [2,3,6,7] ---> 7
//  括号里是 target ，边是数组里要减去的值。
//  本题组合没有路径差别，所以为了去重，每次都只考虑后边的。比如2考虑2367，3考虑367。
//  子节点小于0返回，等于0加入到结果中
//
//
//                                             (7)
//                                  /          /\        \
//                                 /          /  \        \
//                               2/         3/   6\       7\
//                               /          /      \        \
//                              /          /        \        \
//                             (5)        (4)       (1)      (0)
//                        /    / \   \       \       \         \
//                       /    /   \   \     3\6\7     6\7       7
//                     2/    /3   6\   \7
//                     /    /       \   \
//                    /    /         \   \
//                  (3)   (2)       (-1) (-2)
//                  //\\   *
//                 //  \\
//               2/  3\6\7
//               /
//              /
//             (1)
//        /   /   \   \
//      2/   /3    \6  \7
//      /   /       \   \
//    (-1) (-2)    (-5) (-6)
import Foundation
class Solution {
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        var results = [[Int]]()
        let sorted = candidates.sorted()
        var temp = [Int]()
        
        backtrack(&results, temp: &temp, candidates: sorted, remain: target, start: 0)
        return results
    }
    
    // 因为要过滤掉重复的，所以每次都只看 start 这个 原数组 index 以后的组合
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
            temp.append(candidates[i])
            print(candidates[i])
            backtrack(&results, temp: &temp, candidates: candidates, remain: remain-candidates[i], start: i)
            print(temp)
            temp.removeLast()
            print(temp)
        }
    }
}
