//
//  102-Binary-Tree-Level-Order-Traversal.swift
//  algorithm
//
//  Created by Lugick Wang on 2020/3/30.
//  Copyright © 2020 Lugick Wang. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Solution {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var data = [[Int]]()
        var tempArray = [TreeNode]()
        tempArray.append(root)
        
        while tempArray.count > 0 {
            var temp = [Int]()
            for _ in 0..<tempArray.count {
                let node = tempArray.removeFirst()
                temp.append(node.val)
                if let left = node.left {
                    tempArray.append(left)
                }
                if let right = node.right {
                    tempArray.append(right)
                }
            }
            print(temp)
            
            data.append(temp)
        }
        
        print(data)
        
        return data
    }
}
