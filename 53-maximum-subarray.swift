//
//  53-maximum-subarray.swift
//  
//
//  Created by Lugick Wang on 2020/10/14.
//

import Foundation

class Solution {
    //前几项和为正才加，否则更新为最新的数字
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var temp = nums[0]
        for i in 1..<nums.count {
            if temp > 0 {
                temp += nums[i]
            } else {
                temp = nums[i]
            }
            
            maxSum = max(temp, maxSum)
        }
        return maxSum
    }
}
