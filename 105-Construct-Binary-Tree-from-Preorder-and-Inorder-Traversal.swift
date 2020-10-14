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
//    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//        return recursive(preorder, inorder, 0, 0, inorder.count - 1)
//    }
//
//    /// 构建二叉树，主要靠中序遍历/Construct Binary Tree，inorder is important
//    /// - Parameters:
//    ///   - preorder: 先序遍历/Preorder
//    ///   - inorder: 中序遍历/Inorder
//    ///   - rootIndexInPreorder: 树的根节点在先序遍历中的index/tree root index in the preorder
//    ///   - treeLeftIndexInInorder: 树的左边在中序便利中的index/tree left index in the inorder
//    ///   - treeRightIndexInInorder: 树的右边在中序便利中的index/tree right index in the inorder
//    /// - Returns: 树/tree
//    func recursive(_ preorder: [Int], _ inorder: [Int], _ rootIndexInPreorder: Int, _ treeLeftIndexInInorder: Int, _ treeRightIndexInInorder: Int) -> TreeNode? {
//        //边界问题/boundry conditions
//        if preorder.count != inorder.count {
//            return nil
//        }
//
//        if treeLeftIndexInInorder > treeRightIndexInInorder {
//            return nil
//        }
//
//        //根节点/the root node
//        let root = TreeNode(preorder[rootIndexInPreorder])
//
//        //找到根节点在中序中的index/find root index in the inorder
//        let rootIndex = findRootIndexInInorder(root.val, inorder)
//
//        //左子树的根节点在先序遍历中的index就是根节点在先序遍历中的index+1
//        //the left-tree root index is root index plus 1 in preorder
//        //中序遍历中左子树的左边index就是当前树的左边index
//        //the left-tree left boundry index is the tree left index in inorder
//        //中序遍历中左子树的右边index就是根节点在中序中的index-1
//        //the left-tree right boundry index is the tree-root index in inorder minus 1
//        root.left = recursive(preorder, inorder, rootIndexInPreorder+1, treeLeftIndexInInorder, rootIndex-1)
//
//        //右子树的根节点在先序遍历中的index就是根节点在先序遍历中的index+左子树长度+1
//        //right-tree root index is root-index+left-tree-length+1
//        //中序遍历中右子树的左边index就是中序遍历中根节点的index+1
//        //the right-tree left boundry index is the tree-root-index+1 in inorder
//        //中序遍历中右子树的右边index就是当前树的右边index
//        //the right-tree right boundry index is the tree right index in inorder
//        root.right = recursive(preorder, inorder, rootIndexInPreorder+(rootIndex-1-treeLeftIndexInInorder+1)+1, rootIndex+1, treeRightIndexInInorder)
//
//
//        return root
//    }
//
//    func findRootIndexInInorder(_ root: Int, _ inorder: [Int]) -> Int {
//        if let index = inorder.firstIndex(of: root) {
//            return index
//        }
//        return 0
//    }
    
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
