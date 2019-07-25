fileprivate let swiftBasics = SwiftBasics()

/// Tester for SwiftBasics
extension Tester {
    func testBasicsAddIntegers() {
        AssertEqual(actual: swiftBasics.addIntegers(1, 4), expected: 5, error: "addIntegers(1, 4) should return 5")
        AssertEqual(actual: swiftBasics.addIntegers(-5, -5), expected: -10, error: "addIntegers(-5, -5) should return -10")
    }

    func testBasicsConcatenateWordsWithSpace() {
        AssertEqual(actual: swiftBasics.concatenateWordsWithSpace("The", "Apple"),
                    expected: "The Apple",
                    error: "concatenate(\"The\", \"Apple\") should return \"The Apple\"")
    }

    func testBasicsHasMonkeyEmoji() {
        AssertEqual(actual: swiftBasics.hasMonkeyEmoji(string: "I didn't hear anything 🙉"),
                    expected: true,
                    error: "hasMonkeyEmoji(\"I didn't hear anything 🙉\") should return true")
        AssertEqual(actual: swiftBasics.hasMonkeyEmoji(string: "Just a giraffe 🦒"),
                    expected: false,
                    error: "hasMonkeyEmoji(\"Just a giraffe 🦒\") should return false")
    }

    func testBasicsArrayContainsZero() {
        AssertEqual(actual: swiftBasics.arrayContainsZero([0, 1, 2, 3]),
                    expected: true,
                    error: "arrayContainsZero([0, 1, 2, 3]) should return true")
        AssertEqual(actual: swiftBasics.arrayContainsZero([1, 2, 3]),
                    expected: false,
                    error: "arrayContainsZero([1, 2, 3]) should return false")
        AssertEqual(actual: swiftBasics.arrayContainsZero([]),
                    expected: false,
                    error: "arrayContainsZero([]) should return false")
    }

    func testBasicsMultiplyValueByMultiplier() {
        AssertEqual(actual: swiftBasics.multiplyValue(10, by: 1.5),
                    expected: 15,
                    error: "multiplyValue(10, by: 1.5) should return 15")
        AssertEqual(actual: swiftBasics.multiplyValue(10, by: 1.54),
                    expected: 15,
                    error: "multiplyValue(10, by: 1.54) should round down and return 15")
        AssertEqual(actual: swiftBasics.multiplyValue(10, by: 1.56),
                    expected: 15,
                    error: "multiplyValue(10, by: 1.54) should round up and return 16")
    }

    func testBasicsTruncateWithEllipsis() {
        AssertEqual(actual: swiftBasics.truncateWithEllipsis(string: "word", maxLength: 4),
                    expected: "word",
                    error: "truncateWithEllipsis(\"word\", maxLength: 4) should not truncate and just return \"word\"")
        AssertEqual(actual: swiftBasics.truncateWithEllipsis(string: "word", maxLength: 3),
                    expected: "wor...",
                    error: "truncateWithEllipsis(\"word\", maxLength: 3) should truncate and return \"wor...\"")
        AssertEqual(actual: swiftBasics.truncateWithEllipsis(string: "", maxLength: 4),
                    expected: "...",
                    error: "truncateWithEllipsis(\"\", maxLength: 4) should truncate and return \"...\"")
    }
}
