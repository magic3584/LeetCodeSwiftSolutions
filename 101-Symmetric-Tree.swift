//
//  101-Symmetric-Tree.swift
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
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return isSymmetric(left: root?.left, right: root?.right)
    }
    
    func isSymmetric(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        
        if (left != nil && right == nil) || (left == nil && right != nil) || left?.val != right?.val {
            return false
        }
        return isSymmetric(left: left?.left, right: right?.right) && isSymmetric(left: left?.right, right: right?.left)
    }
}
