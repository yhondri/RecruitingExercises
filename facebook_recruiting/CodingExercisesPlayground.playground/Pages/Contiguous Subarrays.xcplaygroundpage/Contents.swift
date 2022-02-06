//: [Previous](@previous)

import Foundation

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 # Contiguous Subarrays

 One simple way to encrypt a string is to "rotate" every alphanumeric character by a certain amount. Rotating a character means replacing it with another character that is a certain number of steps away in normal alphabetic or numerical order.

 ---
 
*/

func countSubarrays(array: [Int]) -> [Int] {
    // Write your code here
    var result = [Int]()
    for i in 0..<array.count {
        let currentValue = array[i]
        
        //From index to 0
        var numSubArrays = 1
        var subArrayIndex = i-1
        while(subArrayIndex >= 0 && array[subArrayIndex] < currentValue) {
            numSubArrays += 1
            subArrayIndex -= 1
        }
        
        //From index to count-1
        subArrayIndex = i+1
        while(subArrayIndex < array.count && array[subArrayIndex] < currentValue) {
            numSubArrays += 1
            subArrayIndex += 1
        }
        
        result.append(numSubArrays)
    }

    return result
}


private var testCaseNumber = 1;
func check(expected: [Int], output: [Int]) {
    let expectedSize = expected.count
    let outputSize = output.count
    var result = true
    if expectedSize != outputSize {
        result = false
    }
    for i in 0..<min(expectedSize, outputSize) {
        result = result && (output[i] == expected[i])
    }
    
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    
    if result {
        print("\(rightTick) Test # \(testCaseNumber)")
    } else {
        print("\(wrongTick) Test # \(testCaseNumber): Expected ")
        print(expected)
        print(" Your output: ")
        print(output)
    }
    
    testCaseNumber += 1
}

func run() {
    let test1 = [3, 4, 1, 6, 2]
    let expected1 = [1, 3, 1, 5, 1]
    let ouput1 = countSubarrays(array: test1)
    check(expected: expected1, output: ouput1)
    
    let test2 = [2, 4, 7, 1, 5, 3]
    let expected2 = [1, 2, 6, 1, 3, 1]
    let ouput2 = countSubarrays(array: test2)
    check(expected: expected2, output: ouput2)
}

run()
//func printInteger(array: [Int]) {
//    for i in 0..<array.count {
//        if i != 0 {
//            print(", ")
//        }
//        print(array[i])
//    }
//}
