//
//  offer-06-cong-wei-dao-tou-da-yin-lian-biao-lcof.swift
//
//
//  Created by Lugick Wang on 2021/7/7.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var tmp = [Int]()
        
        var headNode = head
        while let node = headNode {
            tmp.insert(node.val, at: 0)
            headNode = node.next
        }
        
        
        return tmp
    }
}

class MinStack {

    var stack = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        
    }
    
    func pop() {

    }
    
    func top() -> Int {

    }
    
    func min() -> Int {

    }
}
