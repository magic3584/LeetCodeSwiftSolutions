//
//  301-remove-invalid-parentheses.swift
//  
//
//  Created by Lugick Wang on 2021/4/14.
//

import Foundation

var validResults = Set<String>()

func removeInvalidParentheses(_ s: String) -> [String] {
    let characters = Array(s)
    
    
    //第一步：遍历一次计算多余的左右括号个数
    var leftRemove = 0
    var rightRemove = 0
    
    for character in characters {
        if character == "(" {
            leftRemove += 1
            
        } else if (character == ")") {
            if leftRemove == 0 {
                rightRemove += 1
                
            } else if (leftRemove > 0) {
                leftRemove -= 1
            }
            
        }
    }
    
    
    //第二步，回溯
    var result = ""
    dfs(index: 0, leftCount: 0, rightCount: 0, leftRemove: leftRemove, rightRemove: rightRemove, path: &result, string: s)
    
    return Array(validResults)
}

///
/// - Parameters:
///   - index: 下标
///   - leftCount: 已经遍历到的左括号的个数
///   - rightCount: 已经遍历到的右括号的个数
///   - leftRemove: 最少应该删除的左括号的个数
///   - rightRemove: 最少应该删除的右括号的个数
///   - path: 可能的string
///   - string: 原来字符
func dfs(index:Int, leftCount:Int, rightCount:Int, leftRemove:Int, rightRemove:Int, path:inout String, string:String) {
    
    if index == string.count {
        if leftRemove == 0 && rightRemove == 0 {
            validResults.insert(path)
        }
        return
    }
    
    let character = Array(string)[index]
    
    //可能的操作1：删除当前字符
    if character == "(" && leftRemove > 0{
        // 由于 leftRemove > 0，并且当前遇到的是左括号，因此可以尝试删除当前遇到的左括号
        dfs(index: index+1, leftCount: leftCount, rightCount: rightCount, leftRemove: leftRemove-1, rightRemove: rightRemove, path: &path, string: string)
    }
    
    if character == ")" && rightRemove > 0 {
        // 由于 rightRemove > 0，并且当前遇到的是右括号，因此可以尝试删除当前遇到的右括号
        dfs(index: index+1, leftCount: leftCount, rightCount: rightCount, leftRemove: leftRemove, rightRemove: rightRemove-1, path: &path, string: string)
    }
    
    //可能的操作2：保留当前字符
    path.append(character)
    
    if character != "(" && character != ")" {
        dfs(index: index+1, leftCount: leftCount, rightCount: rightCount, leftRemove: leftRemove, rightRemove: rightRemove, path: &path, string: string)
    } else if character == "(" {
        dfs(index: index+1, leftCount: leftCount+1, rightCount: rightCount, leftRemove: leftRemove, rightRemove: rightRemove, path: &path, string: string)
    } else if leftCount > rightCount {
        dfs(index: index+1, leftCount: leftCount, rightCount: rightCount+1, leftRemove: leftRemove, rightRemove: rightRemove, path: &path, string: string)

        
    }
    path.removeLast()
}
