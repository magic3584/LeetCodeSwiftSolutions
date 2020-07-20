//
//  70-Climbing Stairs.swift
//  
//
//  Created by Lugick Wang on 2020/7/11.
//

import Foundation

class Solution {
    func numWays(_ n: Int) -> Int {
        var a = 1
        var b = 1
        var sum = 2

        for i in 0..<n {
            sum = (a + b) % 1000000007
            a = b
            b = sum
        }
        return a
    }
}
