//
//  offer-22-链表中倒数第k个节点.swift
//  
//
//  Created by Lugick Wang on 2020/7/20.
//

import Foundation

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
/*
 eg: k = 2
 
 1-----2-----3------4--------5------null
 |           |
 |           |
 |           |
 
 head       tail
 
 */

class Solution {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var headCursor = head
        var tailCursor = head

        for _ in 0..<k {
            tailCursor = tailCursor?.next
        }
        
        
        while tailCursor != nil {
            headCursor = headCursor?.next
            tailCursor = tailCursor?.next
        }
        
        return headCursor
    }
}
