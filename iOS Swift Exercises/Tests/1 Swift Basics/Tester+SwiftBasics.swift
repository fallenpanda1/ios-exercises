fileprivate let swiftBasics = SwiftBasics()

/// Tester for SwiftBasics
extension Tester {
    func testBasicsAddIntegers() {
        AssertEqual(actual: swiftBasics.addIntegers(1, 4), expected: 5, error: "1 + 4 should equal 5")
        AssertEqual(actual: swiftBasics.addIntegers(-5, -5), expected: -10, error: "-5 + -5 should equal -10")
    }

    func testBasicsConcatenateWordsWithSpace() {
        AssertEqual(actual: swiftBasics.concatenateWordsWithSpace("The", "Apple"),
                    expected: "The Apple",
                    error: "\"The\" and \"Apple\" should evaluate to \"The Apple\"")
    }

    func testBasicsHasMonkeyEmoji() {
        AssertEqual(actual: swiftBasics.hasMonkeyEmoji(string: "I didn't hear anything 🙉"),
                    expected: true,
                    error: "The string \"I didn't hear anything 🙉\" should be true")
        AssertEqual(actual: swiftBasics.hasMonkeyEmoji(string: "Just a giraffe 🦒"),
                    expected: false,
                    error: "The string \"Just a giraffe 🦒\" should be false")
    }

    func testBasicsArrayContainsZero() {
        AssertEqual(actual: swiftBasics.arrayContainsZero([0, 1, 2, 3]),
                    expected: true,
                    error: "Array [0, 1, 2, 3] should return true")
        AssertEqual(actual: swiftBasics.arrayContainsZero([1, 2, 3]),
                    expected: true,
                    error: "Array [1, 2, 3] should return false")
        AssertEqual(actual: swiftBasics.arrayContainsZero([]),
                    expected: false,
                    error: "Empty array should return false")
    }
}
