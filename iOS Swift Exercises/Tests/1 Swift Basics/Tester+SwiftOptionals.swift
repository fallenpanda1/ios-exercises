fileprivate let swiftOptionals = SwiftOptionals()

/// Tester for SwiftOptionals
extension Tester {
    func testOptionalsForceUnwrap() {
        AssertEqual(actual: swiftOptionals.forceUnwrap(input: 1),
                    expected: 1,
                    error: "force unwrapping 1 should still return 1")
    }

    func testOptionalsUnwrapUsingConditionalBinding() {
        AssertEqual(actual: swiftOptionals.unwrapUsingConditionalBinding(input: 1),
                    expected: 1,
                    error: "passing in 1 should still return 1")
        AssertEqual(actual: swiftOptionals.unwrapUsingConditionalBinding(input: nil),
                    expected: 0,
                    error: "passing in nil should return the default value of 0")
    }

    func testOptionalsUnwrapUsingGuardLetBinding() {
        AssertEqual(actual: swiftOptionals.unwrapUsingGuardLetBinding(input: 1),
                    expected: 1,
                    error: "passing in 1 should still return 1")
        AssertEqual(actual: swiftOptionals.unwrapUsingGuardLetBinding(input: nil),
                    expected: 0,
                    error: "passing in nil should return the default value of 0")
    }

    func testOptionalsConvertToInt() {
        AssertEqual(actual: swiftOptionals.convertToInt(string: "123"),
                    expected: 123,
                    error: "passing in 1 should still return 1")
        AssertEqual(actual: swiftOptionals.convertToInt(string: "a123b"),
                    expected: nil,
                    error: "passing in nil should return the default value of 0")
        AssertEqual(actual: swiftOptionals.convertToInt(string: ""),
                    expected: nil,
                    error: "passing in nil should return the default value of 0")
    }

    func testOptionalsConvertOptionalToInt() {
        AssertEqual(actual: swiftOptionals.convertOptionalToInt(string: "123"),
                    expected: 123,
                    error: "passing in string \"123\" should return 123")
        AssertEqual(actual: swiftOptionals.convertOptionalToInt(string: "a123b"),
                    expected: nil,
                    error: "passing in non-integer string should return nil")
        AssertEqual(actual: swiftOptionals.convertOptionalToInt(string: ""),
                    expected: nil,
                    error: "passing in empty string should return nil")
        AssertEqual(actual: swiftOptionals.convertOptionalToInt(string: nil),
                    expected: nil,
                    error: "passing in nil should return nil")
    }

    func testOptionalsMaxElementOfArray() {
        AssertEqual(actual: swiftOptionals.maxElement(ofArray: [1, 2, 3]),
                    expected: 3,
                    error: "max element of array [1, 2, 3] should be 3")
        AssertEqual(actual: swiftOptionals.maxElement(ofArray: [1]),
                    expected: 1,
                    error: "max element of array [1] should be 1")
        AssertEqual(actual: swiftOptionals.maxElement(ofArray: []),
                    expected: nil,
                    error: "max element of an empty array should be nil")
    }

    func testOptionalsMaxElementOfOptionalsArray() {
        AssertEqual(actual: swiftOptionals.maxElement(ofOptionalsArray: [1, 2, 3]),
                    expected: 3,
                    error: "max element of array [1, 2, 3] should be 3")
        AssertEqual(actual: swiftOptionals.maxElement(ofOptionalsArray: [1, nil, 3]),
                    expected: 3,
                    error: "max element of array [1, nil, 3] should be 3")
        AssertEqual(actual: swiftOptionals.maxElement(ofOptionalsArray: [1]),
                    expected: 1,
                    error: "max element of array [1] should be 1")
        AssertEqual(actual: swiftOptionals.maxElement(ofOptionalsArray: [nil, nil]),
                    expected: nil,
                    error: "max element of array [nil, nil] should be nil")
        AssertEqual(actual: swiftOptionals.maxElement(ofOptionalsArray: []),
                    expected: nil,
                    error: "max element of an empty array should be nil")
    }
}
