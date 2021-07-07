//
//  offer-09-yong-liang-ge-zhan-shi-xian-dui-lie-lcof.swift
//
//
//  Created by Lugick Wang on 2021/7/7.
//

import Foundation


class CQueue {
    
    var stack1 = [Int]()
    var stack2 = [Int]()

    init() {
        
    }
    
    func appendTail(_ value: Int) {
        stack1.append(value)
    }
    
    func deleteHead() -> Int {
        if stack2.isEmpty {
            while let head = stack1.popLast() {
                stack2.append(head)
            }
        }
        return stack2.popLast() ?? -1
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
