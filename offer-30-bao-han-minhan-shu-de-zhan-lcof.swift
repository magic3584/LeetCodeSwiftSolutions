//
//  offer-30-bao-han-minhan-shu-de-zhan-lcof.swift
//  
//
//  Created by Lugick Wang on 2021/7/7.
//

import Foundation

class MinStack {

    var stack = [Int]()
    
    //最小的在栈顶
    var minStack = [Int]()
    
    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {
        stack.append(x)
        
        if minStack.isEmpty {
            minStack.append(x)
        } else {
            var index = minStack.count
            for i in stride(from: minStack.count-1, through: 0, by: -1) {
                if x > minStack[i]{
                    index = i
                    break
                }
            }
            
            minStack.insert(x, at: index)
        }
    }
    
    func pop() {
        if let value = stack.popLast() {
            var index = minStack.count
            for i in stride(from: minStack.count-1, through: 0, by: -1) {
                if value == minStack[i]{
                    index = i
                    break
                }
            }
            minStack.remove(at: index)
        }
    }
    
    func top() -> Int {
        return stack.last ?? -1
    }
    
    func min() -> Int {
        return minStack.last ?? -1
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.min()
 */
