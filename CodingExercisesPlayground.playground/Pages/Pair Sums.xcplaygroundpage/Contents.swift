//: [Previous](@previous)

import Foundation

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 # Pair Sums

 Given a list of n integers arr[0..(n-1)], determine the number of different pairs of elements within it which sum to k.
 ---
 
*/

// Add any helper functions you may need here


func numberOfWays(arr: [Int], k: Int) -> Int {
    var counter = 0
    var index = 0
    while (index < arr.count){
        let currentValue = arr[index]
        var j = index+1
        while(j < arr.count) {
            if currentValue + arr[j] == k {
                counter += 1
            }
            j += 1
        }
        
        index += 1
    }
  // Write your code here
  return counter

}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1
func check(expected: Int, output: Int) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
  }
  test_case_number += 1
}

// Call numberOfWays() with test cases here
let arr1 = [ 1, 2, 3, 4, 3]
let k1 = 6
check(expected: 2, output: numberOfWays(arr: arr1, k: k1))

let arr2 = [ 1, 5, 3, 3, 3]
let k2 = 6
check(expected: 4, output: numberOfWays(arr: arr2, k: k2))

// Add your own test cases here
