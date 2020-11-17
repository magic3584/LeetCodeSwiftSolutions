//
//  offer-50-di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof.swift
//  
//
//  Created by Lugick Wang on 2020/11/17.
//  遍历两次

import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Character {
        guard s.count > 0 else { return " "}
        
        var map = [Character: Int]()
        
        for char in s {
            map[char, default: 0] += 1
        }
        
        for char in s {
            if map[char] == 1 {
                return char
            }
        }
        
        return " "
    }
}
