//
//  112-Path-Sum.swift
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
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil && root?.val == sum {
            return true
        }
        return hasPathSum(root!.left, sum-root!.val) || hasPathSum(root!.right, sum-root!.val)
    }
}
