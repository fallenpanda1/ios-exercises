import Foundation

enum Lesson: String, CaseIterable {
    case basics
    case optionals
    case protocols

    var index: Int {
        return Lesson.allCases.firstIndex(of: self)!
    }

    static func withIndex(_ index: Int) -> Lesson {
        return Lesson.allCases[index]
    }
}

enum TestResult {
    case pass
    case fail
    case skipped
}

/// Make this ObjC compatible so that we can introspectively run all the tests
@objcMembers
class Tester: NSObject {
    private var currentTestErrors = [String]()
    private var hasAnyTestFailed = false

    private lazy var allTestsGroupedByLesson: [Lesson: [Selector]] = {
        var testsByLesson = [Lesson: [Selector]]()
        var methodCount: UInt32 = 0
        let methodList = class_copyMethodList(type(of: self), &methodCount)!
        for i in 0..<Int(methodCount) {
            let selector = method_getName(methodList[i])
            let selName = sel_getName(selector)
            let methodName = String(cString: selName, encoding: String.Encoding.utf8)!

            guard methodName.hasPrefix("test") else { continue }

            let lesson = extractLessonPrefix(fromMethodName: methodName)
            var tests = testsByLesson[lesson] ?? []
            tests.append(selector)
            testsByLesson[lesson] = tests
        }
        return testsByLesson
    }()

    /// Run all methods that are prefixed with 'test-'
    /// Returns an array of (testName, resultBoolean) tuples
    func runAllTests() -> [Lesson: [(String, TestResult)]] {
        var testResultsByLesson = [Lesson: [(String, TestResult)]]()
        var didFailEarlier = false

        // use allCases to determine order of lessons
        for lesson in Lesson.allCases {
            let tests = allTestsGroupedByLesson[lesson]!
            for test in tests {
                // perform the current test
                perform(test)

                let testResult: TestResult
                if didFailEarlier {
                    // skip all further tests after one fails
                    testResult = .skipped
                } else if currentTestErrors.count > 0 {
                    testResult = .fail
                    didFailEarlier = true
                } else {
                    testResult = .pass
                }

                currentTestErrors.removeAll()

                // strip out prefix and clean up casing for method name
                // e.g. convert testBasicAddIntegers -> addIntegers
                let selName = sel_getName(test)
                let methodName = String(cString: selName, encoding: String.Encoding.utf8)!
                let testPrefixLength = "test".count
                let lessonPrefixLength = lesson.rawValue.count
                let totalPrefixLength = testPrefixLength + lessonPrefixLength
                let shortMethodName = String(methodName.dropFirst(totalPrefixLength)).lowercasedFirstLetter

                var lessonResults: [(String, TestResult)] = testResultsByLesson[lesson] ?? []
                lessonResults.append((shortMethodName, testResult))
                testResultsByLesson[lesson] = lessonResults
            }
        }

        return testResultsByLesson
    }

    private func extractLessonPrefix(fromMethodName methodName: String) -> Lesson {
        for lesson in Lesson.allCases {
            if methodName.lowercased().contains(lesson.rawValue) {
                return lesson
            }
        }
        fatalError("Method \(methodName) does not contain a valid lesson prefix")
    }

    func Assert(_ statement: Bool, error: String) {
        if !statement {
            currentTestErrors.append(error)
        }
    }

    func Fail(error: String) {
        Assert(false, error: error)
    }

    func AssertEqual<T: Equatable>(actual: T, expected: T, error: String) {
        if actual != expected {
            let errorWithExpected = error + " ... got \(expected)"
            currentTestErrors.append(errorWithExpected)
        }
    }
}

extension String {
    var lowercasedFirstLetter: String {
        return prefix(1).lowercased() + dropFirst()
    }
}
