//
//  784-Letter-Case-Permutation.swift
//  
//
//  Created by Lugick Wang on 2021/1/29.
//

import Foundation

class Solution {
    
    func letterCasePermutation(_ S: String) -> [String] {
        var characters = S.map({String($0)})
        
        var results = [String]()
        backtracking(array: &characters, index: 0, results: &results)
        
        return results
    }
    
    func backtracking(array:inout [String], index: Int, results:inout [String]) {
        if index == array.count {
            results.append(array.joined(separator: ""))
            return
        }
        
        //不处理的分支直接下一层
        backtracking(array: &array, index: index+1, results: &results)
        
        //处理的分支
        if Character(array[index]).isLetter {
            print(index)
            if let ascii = array[index].unicodeScalars.first?.value {
                array[index] = String(UnicodeScalar(UInt8(ascii^(1<<5))))
                backtracking(array: &array, index: index+1, results: &results)
            }
        }
    }
}

Solution().letterCasePermutation("a1b2")
