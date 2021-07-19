//
//  offer-31-zhan-de-ya-ru-dan-chu-xu-lie-lcof.swift
//  
//
//  Created by Lugick Wang on 2021/7/18.
//

import Foundation

class Solution {
    
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var index = 0
        
        for i in 0..<pushed.count {
            stack.append(pushed[i])
            
            while index < popped.count && stack.last == popped[index] {
                stack.popLast()
                index += 1
            }
        }
        
        return stack.isEmpty
    }
}
