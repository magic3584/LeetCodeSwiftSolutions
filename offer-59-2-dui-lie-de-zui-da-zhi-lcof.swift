//
//  offer-59-队列最大值.swift
//  
//
//  Created by Lugick Wang on 2020/7/20.
//

import Foundation

class MaxQueue {

    var maxQueue = [Int]()
    var queue = [Int]()//从大到小
    
    func max_value() -> Int {
        return maxQueue.first ?? -1
    }
    
    func push_back(_ value: Int) {
        while let last = maxQueue.last, last < value {
            maxQueue.removeLast()
        }
        queue.append(value)
        maxQueue.append(value)
    }
    
  
    func pop_front() -> Int {
        if let first = queue.first, let firstInMax = maxQueue.first {
            
            if first == firstInMax {
                maxQueue.removeFirst()
            }
            queue.removeFirst()
            return first
        } else {
            return -1
        }
    }
}

/**
 * Your MaxQueue object will be instantiated and called as such:
 * let obj = MaxQueue()
 * let ret_1: Int = obj.max_value()
 * obj.push_back(value)
 * let ret_3: Int = obj.pop_front()
 */
