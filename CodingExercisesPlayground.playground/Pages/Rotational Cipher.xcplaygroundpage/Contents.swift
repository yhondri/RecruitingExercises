//: [Previous](@previous)

import Foundation

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 # Rotational Cipher

 One simple way to encrypt a string is to "rotate" every alphanumeric character by a certain amount. Rotating a character means replacing it with another character that is a certain number of steps away in normal alphabetic or numerical order.

 ---
 
 The key to resolve this problem to me was to realize that we are going to rotate over the characters of the Strings.
 That's use ASCII encoding for letters and numbers.
 
 ### Next we have the range that define number, uppercase letters and lowercase letters in ASCII.
 1. 48 to 57 -- Numbers
 2. 65 to 90 -- Uppercase letters
 3. 97 to 122 -- lowercase letters
 */

struct RotationalCipher {
    let backing: String
    let numberMinValue: UInt32 = Character("0").ascii!
    let numberMaxValue: UInt32 = Character("9").ascii!
    let upperCaseLetterMinValue: UInt32 = Character("A").ascii!
    let upperCaseLetterMaxValue: UInt32 = Character("Z").ascii!
    let lowerCaseLetterMinValue: UInt32 = Character("a").ascii!
    let lowerCaseLetterMaxValue: UInt32 = Character("z").ascii!

    
    /// This function takes a String and apply a rotation factor.
    /// - Parameter withRotationFactor: The rotation factor that function will apply to the String.
    /// - Returns: the String with the rotation factor applied.
    func cipher(withRotationFactor: Int) -> String {
        var finalString = ""
        for character in backing {
            guard let asciiValue = character.ascii else { continue }
            
            //It's a number
            if asciiValue >= 48 && asciiValue <= 57 {
                let character = getLetterAsciiValue(asciiValue: Int(asciiValue), rotationFactor: (withRotationFactor), minValue: Int(numberMinValue), maxValue: Int(numberMaxValue))
                finalString.append(character.stringValue)
            } else if asciiValue >= 65 && asciiValue <= 90 {
                let character = getLetterAsciiValue(asciiValue: Int(asciiValue), rotationFactor: (withRotationFactor), minValue: Int(upperCaseLetterMinValue), maxValue: Int(upperCaseLetterMaxValue))
                finalString.append(character.stringValue)
            } else if asciiValue >= 97 && asciiValue <= 122 {
                let character = getLetterAsciiValue(asciiValue: Int(asciiValue), rotationFactor: (withRotationFactor), minValue: Int(lowerCaseLetterMinValue), maxValue: Int(lowerCaseLetterMaxValue))
                finalString.append(character.stringValue)
            } else {
                finalString.append(asciiValue.stringValue)
            }
        }
        
        return finalString
    }

    /// Get ASCII value of a letter after apply a rotationFactor.
    ///  Cost: O(n) where n is equal to rotationFactor because in the worst case we need to loop n times.
    /// - Parameters:
    ///   - asciiValue: the value which rotation factor wil be applied.
    ///   - rotationFactor: the rotation factor will be applied.
    ///   - minValue: the min value of this ascii character. If it is an number, minValue = 48, uppercase letter = 65, lowercase letter = 97.
    ///   - maxValue: the max value of this ascii character. If it is an number, minValue = 57, uppercase letter = 90, lowercase letter = 122.
    /// - Returns: the new character after apply the rotation factor.
    func getLetterAsciiValue(asciiValue: Int, rotationFactor: Int, minValue: Int, maxValue: Int) -> UInt32 {
        if (asciiValue + rotationFactor) <= maxValue { //If after apply the rotation factor the value is inside the allowed range, return the value.
            return UInt32(asciiValue + rotationFactor)
        } else {
            var resto = (asciiValue + rotationFactor) - maxValue - 1 //Get the reminder after apply rotation factor and go to the first allowed value of asciiValue.
            var currentValue = minValue
            while(resto > 0) {
                currentValue += 1
                if currentValue > maxValue {
                    currentValue = minValue
                }
                resto -= 1
            }
            return UInt32(currentValue)
        }
    }
}

// MARK: - Helper extensions
extension Character {
    var isAscii: Bool {
        return unicodeScalars.allSatisfy { $0.isASCII }
    }
    
    var ascii: UInt32? {
        return isAscii ? unicodeScalars.first?.value : nil
    }
}

extension UInt32 {
    var stringValue: Character {
        guard let scalarValue = UnicodeScalar(Int(self)) else { return "-" }
        return Character(scalarValue)
    }
}


/*:
 Facebook test region
 
 These are the tests we use to determine if the solution is correct.
 You can add your own at the bottom.
*/
private extension String {
  var characterArray: String {
    return "[\"\(self)\"]"
  }
}

private var testCaseNumber = 1;
 
private extension RotationalCipher {
  static func check(_ expectedValue: String, against output: String) {
    let rightTick = "\u{2713}";
    let wrongTick = "\u{2717}";
    
    let result = expectedValue == output
    if result {
      print("\(rightTick) Test #\(testCaseNumber)")
    } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue.characterArray) Your output: \(output.characterArray)")
    }
    testCaseNumber += 1
  }
}

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
RotationalCipher.check(expected1, against: output1)

let input2 = "abcdZXYzxy-999.@"
let expected2 = "stuvRPQrpq-999.@"
let output2 = RotationalCipher(backing: input2).cipher(withRotationFactor: 200)
RotationalCipher.check(expected2, against: output2)
