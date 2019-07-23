import Foundation

/// Make this ObjC compatible so that we can introspectively run all the tests
@objcMembers
class Tester: NSObject {
    /// Run all methods that are prefixed with 'test-'
    /// Returns an array of (testName, resultBoolean) tuples
    func runAllTests() -> [(String, Bool)] {
        let tester = Tester()
        var testResultsByTestName = [(String, Bool)]()

        var methodCount: UInt32 = 0
        let methodList = class_copyMethodList(type(of: tester), &methodCount)!
        for i in 0..<Int(methodCount) {
            let selector = method_getName(methodList[i])
            let selName = sel_getName(selector)
            let methodName = String(cString: selName, encoding: String.Encoding.utf8)!

            if methodName.hasPrefix("test") {
                let testResult: Bool
                // converting between return of performSelector (UnsafePointer<AnyObject>)
                // and Bool is awkward in Swift. This if perform(selector) is a workaround
                if tester.perform(selector) != nil {
                    testResult = true
                } else {
                    testResult = false
                }
                testResultsByTestName.append((methodName, testResult))
            }
        }
        return testResultsByTestName
    }

    func testThatAlwaysSucceeds() -> Bool {
        return true
    }

    func testThatAlwaysFails() -> Bool {
        return false
    }
}
