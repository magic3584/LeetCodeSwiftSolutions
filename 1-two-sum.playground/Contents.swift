//: Playground - noun: a place where people can play

import UIKit
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var newArray = [Int]()
    var remain = 0
    var firstIndex = 0

    var targetArray = [Int]()
    
    for (index, value) in nums.enumerated() {
        remain = target - value
        if newArray.contains(remain) {
            firstIndex = newArray.firstIndex(of: remain)!
            targetArray.append(firstIndex)
            targetArray.append(index)
            break
        } else {
            newArray.append(value)
        }
    }
    return targetArray
}

twoSum([2,7,8,11], 9)


