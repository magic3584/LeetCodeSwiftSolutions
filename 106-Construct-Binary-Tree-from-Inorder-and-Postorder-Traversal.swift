//
//  106-Construct-Binary-Tree-from-Inorder-and-Postorder-Traversal.swift
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count != postorder.count {return nil}
        if inorder.count == 0 {return nil}
        idx = postorder.count - 1
        return helper(inorder, postorder, 0, idx)
    }
    
    func helper(_ inorder: [Int], _ postorder: [Int], _ start:Int, _ end: Int)-> TreeNode? {
        if start > end {return nil}
        let node = TreeNode(postorder[idx])
        idx -= 1
        if start == end { return node }
        let index = findIdx(inorder, node.val, end)
        node.right = helper(inorder, postorder, index+1, end)
        node.left = helper(inorder, postorder, start, index-1)
        return node
    }
    
    func findIdx(_ inorder: [Int], _ val:Int, _ end:Int)->Int{
        for i in (0...end).reversed(){
            if inorder[i] == val{ return i }
        }
        return 0
    }
}
