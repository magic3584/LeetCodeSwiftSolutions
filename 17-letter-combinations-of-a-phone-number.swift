//
//  17-letter-combinations-of-a-phone-number.swift
//  
//
//  Created by Lugick Wang on 2020/12/30.
//

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let array = ["","","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"]
        var routeString = ""
        var results = [String]()
        
        if digits.count == 0 {
            return results
        }
        
        backtrack(&results, array: array, digits: digits, index: 0, routeString: &routeString)
        
        return results
        
    }
    
    func backtrack(_ results:inout [String], array:[String], digits: String, index: Int, routeString:inout String) {
        
        if index == digits.count {
            results.append(routeString)
            return;
        }
        
        let numberIndex =  Int(String(Array(digits)[index])) ?? 0
        let characters = Array(array[numberIndex])
        
        for i in 0..<characters.count {
            let str = characters[i]
            routeString += String(str)
            print(routeString)
            backtrack(&results, array: array, digits: digits, index: index+1, routeString: &routeString)
            routeString.remove(at: routeString.index(before: routeString.endIndex))
            print("drop")
            print(routeString)

        }
        
    }
}
