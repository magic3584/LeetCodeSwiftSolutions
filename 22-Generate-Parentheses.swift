//
//  22-Generate-Parentheses.swift
//  
//
//  Created by Lugick Wang on 2021/2/23.
//

import Foundation

class Solution {
    //动态规划：
    //dp[i]表示i组括号的所有 有!效!组合。dp[i] = dp[i-1]+i的组合
    //dp[i] = "( dp[p]的所有有效组合 ) +【dp[q]的组合】"，其中 p + q = i-1, p从0遍历到i-1, q则相应从i-1到0
    
    func generateParenthesis(_ n: Int) -> [String] {
        //dp[i]存放i组括号的所有有效组合
        var dp = Array(repeating: [String](), count: n+1)
        
        dp[0] = [""]
        for i in 1..<n+1 {
            for p in 0..<i {
                //dp[p]的所有有效组合
                let pArray = dp[p]
                
                //dp[q]的所有有效组合
                let qArray = dp[i-1-p]
                
                for p1 in pArray {
                    for q1 in qArray {
//                        dp[i].append(String(format: "(%@)%@", p1,q1))
                        dp[i].append("(\(p1))\(q1)")
                    }
                }
            }
        }
          
        return dp[n]
    }
}
