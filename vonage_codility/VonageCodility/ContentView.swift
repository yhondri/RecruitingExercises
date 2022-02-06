//
//  ContentView.swift
//  VonageCodility
//
//  Created by Yhondri Acosta Novas on 9/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Exersice 1") {
                RunExerciseAmazon.exercise1(ratings: [4, 2, 3, 1])
                RunExerciseAmazon.exercise1(ratings: [2, 1, 3])
                RunExerciseAmazon.exercise1(ratings: [4, 3, 5, 4, 3])
            }
            Button("Exersice 2") {
                RunExerciseAmazon.exercise2(discounts: ["daabbd", "abc"])
            }
            Button("Exersice 3") {
                RunExerciseAmazon.exercise3()
            }
    
        }
    }
}

struct RunExerciseAmazon {
    
    static func exercise1(ratings: [Int]) -> Int {
        if ratings.isEmpty {
            return 0
        }
        
        var daysPeriod = 2
        var numberOfGroups = ratings.count //Case on day periods

        while daysPeriod <= ratings.count {
            var currentStartRange = 0
            var groups: [Bool] = []
            while currentStartRange < ratings.count && ((currentStartRange + daysPeriod) <= ratings.count) {
                let valuesToCheck = Array(ratings[currentStartRange...currentStartRange+daysPeriod-1])
                var total = 0
                var currentValue = valuesToCheck[0]
                var isAValidGroup = true
                for i in 1..<valuesToCheck.count {
                    if currentValue - valuesToCheck[i] != 1 {
                        isAValidGroup = false
                    }
                    total += abs(currentValue - valuesToCheck[i])
                    currentValue = valuesToCheck[i]
                }
                
                if isAValidGroup {
                    groups.append(true)
                }

                currentStartRange += daysPeriod - 1
            }
            
            daysPeriod += 1
            numberOfGroups += groups.count
        }
        debugPrint("Exercise 1 ", numberOfGroups)
        
        return numberOfGroups
    }
    
    static func exercise2(discounts: [String]) {
        var result = [Int](repeating: 1, count: discounts.count)
        var wordPosition = 0
        for word in discounts {
            var index = 0
            while index < word.count - 1  {
                if word[index] != word[word.count - index - 1] {
                    result[wordPosition] = 0
                }
                index += 1
            }
            
            wordPosition += 1
        }
        
        debugPrint("Exercise 2 ", result)
    }
    
    static func exercise3() {
        debugPrint("Exercise 3")
    }
    
    static func exercise1Test(repository: [String], customerQuery: String) -> [[String]] {
        var result: [[String]] = []
        for _ in 0..<customerQuery.count-1 {
            result.append([])
        }
        
        let customerQuery = customerQuery.lowercased()
        let repository = repository.map {$0.lowercased()}.sorted()
        
        var query = ""
        var index = 0
        for character in customerQuery {
            query += "\(character)"
        
            if query.count >= 2 {
                
                for word in repository {
                    let wordSubstring = word.prefix(query.count)
                    if wordSubstring.caseInsensitiveCompare(query) == .orderedSame && result[index].count < 3{
                        result[index].append(word)
                    }
                }
                
                index += 1
            }
        }
        
        debugPrint("Resutl ", result)
    
        return result
    }
    
    static func exercise2Test(codeList: [String], shoppingCart: [String]) -> Int {
        if codeList.isEmpty {
            return 1
        }
        
        var newCodeList = [String]()
        for group in codeList {
            let words = group.components(separatedBy: " ")
            newCodeList.append(contentsOf: words)
        }
        
        let codeList = newCodeList
        
        var codeListIndex = 0
        var shoppingCartIndex = 0
        var isAWinner = false
        while shoppingCartIndex < shoppingCart.count && !isAWinner {
            if codeList[codeListIndex] == shoppingCart[shoppingCartIndex] || codeList[codeListIndex] == "anything" {
                codeListIndex += 1
                if codeListIndex == codeList.count {
                    isAWinner = true
                }
            } else {
                codeListIndex = 0
            }
            
            
            shoppingCartIndex += 1
        }
        
        
        debugPrint("isAWinner ", isAWinner)
        
        return isAWinner ? 1 : 0
    }
}

extension StringProtocol {
    subscript(_ offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct RunExerciseVonage {
    static func exercise1() {
//        let values = [553, 213]
//        for value in values {
//            let digits: [Int] = "\(N)".compactMap { Int("\($0)") } //O(N)
//              let sortedArray = digits.sorted(by:{ $0 > $1})
//              let solution = sortedArray.reduce(0, {$0*10 + $1}) //O(N)
////              return solution
//            debugPrint("Exercise 1 ", solution)
//        }
    }
    
    
    static func exercise2_2() {
        var widest = 0
        //E1
        let X = [1, 8, 7, 3, 4, 1, 8].sorted()
//                let Y = [6, 4, 1, 8, 5, 1, 7]
        //E1
//                let X = [5,5,5,7,7,7].sorted()
//                let Y = [3,4,5,1,3,7]
        
        //        var widest = 0
        for i in 0..<X.count-1 {
            let coordinateX1 = X[i]
            let coordinateX2 = X[i+1]
            
            if coordinateX1 != coordinateX2 {
                let currentWidth = coordinateX2 - coordinateX1
                if currentWidth > widest {
                    widest = currentWidth
                }
            }
        }
        
        
        
//        for i in 0..<X.count {
//            let coordinateX1 = X[i]
//
//            var nextXCoordinate = maxValue
//            var nextCoordinateFound = false //Not infinite
//            for z in 0..<X.count {
//                //Check is not the same X coordiante z != i
//                if z != i && coordinateX1 < X[z] && nextXCoordinate > X[z] {
//                    nextXCoordinate = X[z]
//                    nextCoordinateFound = true
//                }
//            }
//
//            if nextCoordinateFound {
//                let currentWidth = nextXCoordinate - coordinateX1
//                if currentWidth > widest {
//                    widest = currentWidth
//                }
//            }
//        }
        
        //return widest
        
        debugPrint("Exercise 2 - Result: ", widest)
    }
    
    
    
    
    
    static func exercise2() {
        var widest = 0
        //E1
        let X = [1, 8, 7, 3, 4, 1, 8]
        let Y = [6, 4, 1, 8, 5, 1, 7]
        //E1
//        let X = [5,5,5,7,7,7]
//        let Y = [3,4,5,1,3,7]
        
//        var widest = 0
            let maxValue = 1000001
            for i in 0..<X.count {
                let coordinateX1 = X[i]
                   
                var nextXCoordinate = maxValue
                var nextCoordinateFound = false //Not infinite
                for z in 0..<X.count {
                        //Check is not the same X coordiante z != i
                    if z != i && coordinateX1 < X[z] && nextXCoordinate > X[z] {
                        nextXCoordinate = X[z]
                        nextCoordinateFound = true
                    }
                }
                    
                if nextCoordinateFound {
                    let currentWidth = nextXCoordinate - coordinateX1
                    if currentWidth > widest {
                         widest = currentWidth
                    }
                }
            }

            //return widest

        debugPrint("Exercise 2 - Result: ", widest)
    }
    
    static func exercise3() {
        debugPrint("Exercise 3")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
