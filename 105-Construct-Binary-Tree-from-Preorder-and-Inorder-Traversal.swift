//
//  105-Construct-Binary-Tree-from-Preorder-and-Inorder-Traversal.swift
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
    
    var idx:Int = 0
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count != inorder.count {
            return nil
        }
        
        idx = 0
        return helper(preorder, inorder, 0, inorder.count-1)
    }
    
    
    func helper(_ preorder: [Int], _ inorder: [Int], _ start:Int, _ end: Int)-> TreeNode? {
        if start > end {
            return nil
        }
        

        
        let node = TreeNode(preorder[idx])
        idx += 1

        if start == end {
            return node
        }
        
        let index = findIdx(inorder, node.val, end)

        node.left = helper(preorder, inorder, start, index-1)
        node.right = helper(preorder, inorder, index+1, end)
        
        return node
    }
    
    func findIdx(_ inorder: [Int], _ val:Int, _ end:Int)->Int{
        for i in (0...end){
            if inorder[i] == val{ return i }
        }
        return 0
    }
}
