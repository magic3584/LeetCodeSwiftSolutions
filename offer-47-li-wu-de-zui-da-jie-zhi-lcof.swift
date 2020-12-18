//
//  offer-47-li-wu-de-zui-da-jie-zhi-lcof.swift
//  
//
//  Created by Lugick Wang on 2020/12/17.
//
//dp: dp[i][j] 表示到达 (i,j) 的礼物最大值
import Foundation

class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        
        guard grid[0].count > 0 else {
            return 0
        }
        
        let row = grid.count
        let column = grid[0].count
        var newGrid = [[Int]]()
        for i in 0..<row {
            newGrid.append([Int]())
            for j in 0..<column {
                newGrid[i].append(grid[i][j])
            }
        }

        //第一行
        for j in 1..<column {
            newGrid[0][j] += newGrid[0][j-1]
        }
        
        
        //第一列
        for i in 1..<row {
            newGrid[i][0] += newGrid[i-1][0]
        }
        print(newGrid)

        for i in 1..<row {
            for j in 1..<column {
                newGrid[i][j] = max(newGrid[i][j-1],newGrid[i-1][j]) + newGrid[i][j]
            }
        }
        print(newGrid)
        return newGrid[row-1][column-1]
    }
}

Solution().maxValue[[1,3,1],[1,5,1],[4,2,1]]
