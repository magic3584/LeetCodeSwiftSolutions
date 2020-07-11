//
//  54-Spiral Matrix.swift
//  
//
//  Created by Lugick Wang on 2020/7/11.
//

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0, matrix[0].count > 0 else {
            return [Int]()
        }
        
        var results = [Int]()
        
        let maxRowCount = matrix.count
        let maxColumnCount = matrix[0].count
        
        var seenArray = [[Bool]]()

        for _ in 0..<maxRowCount {
            var tmp = [Bool]()
            
            for _ in 0..<maxColumnCount {
                tmp.append(false)
            }
            seenArray.append(tmp)
        }
        
        
        let rowA = [0,1,0,-1]
        let columnA = [1,0,-1,0]
        
        var currentRowIndex = 0
        var currentColumnIndex = 0
        var increase = 0
        
        
        for _ in 0..<maxRowCount * maxColumnCount {
            
            print("row\(currentRowIndex),column\(currentColumnIndex)")
            
            results.append(matrix[currentRowIndex][currentColumnIndex])
            seenArray[currentRowIndex][currentColumnIndex] = true
            
            let tmpRow = currentRowIndex + rowA[increase]
            let tmpColumn = currentColumnIndex + columnA[increase]
            
            if tmpRow >= 0 && tmpRow < maxRowCount && tmpColumn >= 0 && tmpColumn < maxColumnCount && !seenArray[tmpRow][tmpColumn] {
                currentRowIndex = tmpRow
                currentColumnIndex = tmpColumn
            } else {
                increase = (increase + 1) % 4
                currentRowIndex += rowA[increase]
                currentColumnIndex += columnA[increase]
            }
            
        }
        
        
        return results
    }
}
