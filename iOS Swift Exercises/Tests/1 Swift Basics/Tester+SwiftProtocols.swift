/// Tester for SwiftProtocols
extension Tester {
    func testProtocolsMyCalculatorImplementation() {
        let myCalculator = MyCalculator()
        guard let calculator = myCalculator as? Calculator else {
            Fail(error: "MyCalculator does not conform to Calculator protocol")
            return
        }

        AssertEqual(actual: calculator.add(3, 2), expected: 5, error: "add(3, 2) should equal 5")
        AssertEqual(actual: calculator.multiply(5, 4), expected: 20, error: "multiply(5, 4) should equal 20")
    }
}
