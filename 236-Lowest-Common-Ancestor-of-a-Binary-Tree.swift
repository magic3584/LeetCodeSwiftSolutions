//
//  236-Lowest-Common-Ancestor-of-a-Binary-Tree.swift
//  algorithm
//
//  Created by Lugick Wang on 2020/3/31.
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
    
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//        if root == nil || root?.val == p?.val || root?.val == q?.val { return root }
//        
//        let left = lowestCommonAncestor(root?.left, p, q)
//        let right = lowestCommonAncestor(root?.right, p, q)
//        
//        return left == nil ? right : right == nil ? left : root
//    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }

        if isThereAWayFrom(p: p, to: q) {
            return p
        }

        if isThereAWayFrom(p: q, to: p) {
            return q
        }

        var tmp = [TreeNode]()
        tmp.append(root)

        var lca = root

        while tmp.count > 0 {

            let popNode = tmp.removeFirst()

            if isThereAWayFrom(p: popNode, to: p) && isThereAWayFrom(p: popNode, to: q) {
                lca = popNode
            }


            if let left = popNode.left {
                tmp.append(left)
            }

            if let right = popNode.right {
                tmp.append(right)
            }
        }

        return lca
    }

    func isThereAWayFrom(p: TreeNode?, to q: TreeNode?) -> Bool {
        if p?.val == q?.val {
            return true
        }

        if p?.left == nil && p?.right == nil {
            return false
        }

        return isThereAWayFrom(p: p?.left, to: q) || isThereAWayFrom(p: p?.right, to: q)
    }
    
}
