/// A lot of the basic Swift concepts covered by the following exercises are covered in
/// https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
class SwiftBasics {

    /// EXERCISE 1
    /// Easy one to get you familiar with doing these exercises. This function is currently stubbed
    /// out to return 0. Fix it so that it actually adds the two input integers.
    /// Example: addIntegers(1, 2) should return 3
    func addIntegers(_ first: Int, _ second: Int) -> Int {
        return 0
    }

    /// EXERCISE 2
    /// Concatenate the two strings with a space in between.
    /// Example: concatenateWordsWithSpace("The", "Apple") should return "The Apple"
    func concatenateWordsWithSpace(_ firstWord: String, _ secondWord: String) -> String {
        return ""
    }

    /// EXERCISE 3
    /// Return true if string contains a monkey emoji
    /// Example: hasMonkeyEmoji("I didn't hear anything 🙉") should return true
    func hasMonkeyEmoji(string: String) -> Bool {
        let monkeyEmojis: [Character] = ["🐒", "🙈", "🙉", "🙊", "🐵"]
        return false
    }

    /// EXERCISE 4
    /// Return true if array of integers contains one or more zeroes
    /// Example: arrayContainsZero([0, 1, 2, 3]) should return true
    func arrayContainsZero(_ array: [Int]) -> Bool {
        return false
    }

    /// EXERCISE 5
    /// Multiply an int value by a float multiplier, rounding to the nearest integer.
    /// This exercise mostly serves to demonstrate that casting between in Swift is very safe
    /// and explicit but is also kind of annoying.
    /// Examples:
    ///   multiplyValue(5, by: 1.1) returns 5 (rounding down from 5.5)
    ///   multiplyValue(6, by: 1.1) returns 7 (rounding up from 6.6)
    func multiplyValue(_ value: Int, by multiplier: Float) -> Int {
        return 0
    }
}
