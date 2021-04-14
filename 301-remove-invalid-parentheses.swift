//
//  301-remove-invalid-parentheses.swift
//  
//
//  Created by Lugick Wang on 2021/4/14.
//

import Foundation


class Solution {
    
//MARK: - DFS
//    var validResults = Set<String>()
//
//    func removeInvalidParentheses(_ s: String) -> [String] {
//        let characters = Array(s)
//
//
//        //第一步：遍历一次计算多余的左右括号个数
//        var leftRemove = 0
//        var rightRemove = 0
//
//        for character in characters {
//            if character == "(" {
//                leftRemove += 1
//
//            } else if (character == ")") {
//                if leftRemove == 0 {
//                    rightRemove += 1
//
//                } else if (leftRemove > 0) {
//                    leftRemove -= 1
//                }
//
//            }
//        }
//
//
//        //第二步，回溯
//        var result = ""
//        dfs(index: 0, leftCount: 0, rightCount: 0, leftRemove: leftRemove, rightRemove: rightRemove, path: &result, string: s)
//
//        return Array(validResults)
//    }
//
//    ///
//    /// - Parameters:
//    ///   - index: 下标
//    ///   - leftCount: 已经遍历到的左括号的个数
//    ///   - rightCount: 已经遍历到的右括号的个数
//    ///   - leftRemove: 最少应该删除的左括号的个数
//    ///   - rightRemove: 最少应该删除的右括号的个数
//    ///   - path: 可能的string
//    ///   - string: 原来字符
//    func dfs(index:Int, leftCount:Int, rightCount:Int, leftRemove:Int, rightRemove:Int, path:inout String, string:String) {
//
//        if index == string.count {
//            if leftRemove == 0 && rightRemove == 0 {
//                validResults.insert(path)
//            }
//            return
//        }
//
//        let character = Array(string)[index]
//
//        //可能的操作1：删除当前字符
//        if character == "(" && leftRemove > 0{
//            // 由于 leftRemove > 0，并且当前遇到的是左括号，因此可以尝试删除当前遇到的左括号
//            dfs(index: index+1, leftCount: leftCount, rightCount: rightCount, leftRemove: leftRemove-1, rightRemove: rightRemove, path: &path, string: string)
//        }
//
//        if character == ")" && rightRemove > 0 {
//            // 由于 rightRemove > 0，并且当前遇到的是右括号，因此可以尝试删除当前遇到的右括号
//            dfs(index: index+1, leftCount: leftCount, rightCount: rightCount, leftRemove: leftRemove, rightRemove: rightRemove-1, path: &path, string: string)
//        }
//
//        //可能的操作2：保留当前字符
//        path.append(character)
//
//        if character != "(" && character != ")" {
//            dfs(index: index+1, leftCount: leftCount, rightCount: rightCount, leftRemove: leftRemove, rightRemove: rightRemove, path: &path, string: string)
//        } else if character == "(" {
//            dfs(index: index+1, leftCount: leftCount+1, rightCount: rightCount, leftRemove: leftRemove, rightRemove: rightRemove, path: &path, string: string)
//        } else if leftCount > rightCount {
//            dfs(index: index+1, leftCount: leftCount, rightCount: rightCount+1, leftRemove: leftRemove, rightRemove: rightRemove, path: &path, string: string)
//
//
//        }
//        path.removeLast()
//    }
    
    
    //MARK: - BFS
    //题目说删除最少括号，就从0个开始删除。如果有符合条件的就结束。由于是暴力列举所有可能，所以执行效率低
    func removeInvalidParentheses(_ s: String) -> [String] {
        var level = Set<String>()
        level.insert(s)
        
        while true {
            //最开始进来的话其实就是删除0个括号了。以后就是各层删除了
            let valid = level.filter({isValid($0)})
            if valid.count > 0 {
                return Array(valid)
            }
            
            //下一层。遍历每一层，每层只删除一个括号。
            var nextLevel = Set<String>()
            for s in level {
                for i in 0..<s.count {
                    if "()".contains(Array(s)[i]) {
                        let str = s.prefix(i)+s.suffix(s.count-i-1)
                        nextLevel.insert(String(str))
                    }
                }
            }
            level = nextLevel
        }
    }
    
    func isValid(_ s: String) -> Bool {
        //遍历过程是左括号个数必须大于等于右括号个数，并且最后个数一定相等
        var leftMinusRight = 0
        for i in Array(s) {
            if i == "(" {
                leftMinusRight += 1
                
            } else if i == ")" {
                leftMinusRight -= 1
            }
            
            if leftMinusRight < 0 {
                return false
            }
        }
        
        return leftMinusRight == 0
        
    }
}
