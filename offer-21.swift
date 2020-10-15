//
//  offer-21.swift
//  
//
//  Created by Lugick Wang on 2020/10/15.
//

import Foundation
class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        var odd = 0
        var even = nums.count - 1
        var copy = nums
        
        while odd < even {
            while copy[odd] % 2 != 0, odd < even {
                odd+=1
            }
            while copy[even] % 2 == 0, odd < even {
                even-=1
            }
            
            print(odd)
            print(even)
            let temp = copy[odd]
            copy[odd] = copy[even]
            copy[even] = temp
            
            odd+=1
            even-=1
            print(copy)

        }
                                                                                                    
        return copy
    }
}
