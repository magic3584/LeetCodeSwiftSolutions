//
//  144-Binary Tree Preorder Traversal.swift
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
    
    var array = [Int]()
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        
        if let val = root?.val {
            array.append(val)
        }
        if let left = root?.left {
            preorderTraversal(left)
        }
        
        if let right = root?.right {
            preorderTraversal(right)
        }
        
        return array
    }
}
