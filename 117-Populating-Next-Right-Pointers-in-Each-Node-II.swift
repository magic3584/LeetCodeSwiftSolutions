//
//  117-Populating-Next-Right-Pointers-in-Each-Node-II.swift
//  algorithm
//
//  Created by Lugick Wang on 2020/3/31.
//  Copyright © 2020 Lugick Wang. All rights reserved.
//

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let rootNode = root else {
            return nil
        }
        
        var data = [Node]()
        data.append(rootNode)
        
        var rowsArray = [[Node]]()
        rowsArray.append([rootNode])
        
        while data.count > 0 {
            
            var row = [Node]()
            
            for _ in 0..<data.count {
                let node = data.removeFirst()
                
                if let left = node.left {
                    row.append(left)
                    data.append(left)
                }
                
                if let right = node.right {
                    row.append(right)
                    data.append(right)
                }
            }
            
            rowsArray.append(row)
        }
        
        
        for row in rowsArray {
            for (index, node) in row.enumerated() {
                if index < row.count - 1 {
                    node.next = row[index+1]
                } else {
                    node.next = nil
                }
            }
        }
        return rootNode
    }
}
