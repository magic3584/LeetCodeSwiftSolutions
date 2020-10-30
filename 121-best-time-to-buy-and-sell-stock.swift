//
//  121-best-time-to-buy-and-sell-stock.swift
//  
//
//  Created by Lugick Wang on 2020/10/30.
//

import Foundation
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0}
        
        var profit = 0
        var min = 0
        
        for i in 1..<prices.count {
           let num = prices[i]
            if num < min {
                min = num
            } else {
                profit = max(profit, num-min)
            }
        }
        return profit
    }
}
