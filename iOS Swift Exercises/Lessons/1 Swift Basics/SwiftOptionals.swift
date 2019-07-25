/// Practice with Swift optionals.
/// Scroll down to the "SWIFT OPTIONALS OVERVIEW" section of this file for an overview + examples.
///
class SwiftOptionals {
    /// EXERCISE 1
    /// return the input as an Int by force unwrapping it
    /// Example: forceUnwrap(1) should return 1
    func forceUnwrap(input: Int?) -> Int {
        return 0
    }

    /// EXERCISE 2
    /// return the input if it exists, 0 if it doesn't exist
    /// (refer to SWIFT OPTIONALS OVERVIEW for the answer + good syntax/practice around this)
    /// Examples:
    ///   unwrapUsingConditionalBinding(1) should return 1
    ///   unwrapUsingConditionalBinding(nil) should return 0
    func unwrapUsingConditionalBinding(input: Int?) -> Int {
        // use if let here
        return 0
    }

    /// EXERCISE 3
    /// Using a guard let, return the input if it exists, 0 if it doesn't exist
    /// Examples:
    ///   unwrapUsingGuardLetBinding(1) should return 1
    ///   unwrapUsingGuardLetBinding(nil) should return 0
    func unwrapUsingGuardLetBinding(input: Int?) -> Int {
        // use guard let here
        return 0
    }

    /// EXERCISE 4
    /// Return the string as an integer if it can be converted to an integer, or
    /// return nil if not (no help provided -- use Google!)
    /// Examples:
    ///   convertToInt("123") = 123
    ///   convertToInt("a123b") = nil
    func convertToInt(string: String) -> Int? {
        return nil
    }

    /// EXERCISE 5
    /// Same as previous except that input is an optional. If the input is
    /// nil, the output should also be nil
    func convertOptionalToInt(string: String?) -> Int? {
        return nil
    }

    /// EXERCISE 6
    /// Return a string if the input object is a string, nil otherwise
    func objectAsString(object: Any) -> String? {
        return nil
    }

    /// EXERCISE 7
    /// Return max value in an array if there is one, or nil if there isn't one.
    /// Remember to handle edge cases.
    /// Examples:
    ///   maxElement([1, 2, 3]) = 3
    ///   maxElement([1]) = 1
    func maxElement(ofArray array: [Int]) -> Int? {
        return nil
    }

    /// EXERCISE 8
    /// Same as previous, except that the input array contains Int? elements,
    /// so some of the elements could be nil
    /// Examples:
    ///   maxElement([1, nil, 3]) = 3
    ///   maxElement([1]) = 1
    ///   maxElement([nil]) = nil
    func maxElement(ofOptionalsArray array: [Int?]) -> Int? {
        return nil
    }
}


////////////////////////////////
/// SWIFT OPTIONALS OVERVIEW ///
////////////////////////////////

/// Swift has the concept of optionals, signified by a question mark (?).
extension SwiftOptionals {
    /// If a function takes in an optional argument but you need the argument to exist, the most
    /// basic way to handle it is to force unwrap the input. You can do this by adding an
    /// exclamation mark after the input, which will convert the optional variable to a non-optional
    /// one IF it exists. If the variable is actually nil, the application will crash with a fatal
    /// error (bypassing exception handling). As you can imagine, this means that force unwrapping
    /// should be used sparingly and carefully.

    /// EXAMPLE 1
    /// Note that the input is of type Int? and the output is of type Int. This means you can't simply
    /// say 'return input' because the input could be nil, but the output is guaranteed to not be nil.
    func exampleForceUnwrapInput(input: Int?) -> Int {
        return input!
    }

    /// Most of the time, rather than force unwrapping, we use optional bindings to handle optional
    /// inputs. There are two ways to do this. One is using an 'if let' statement.

    /// EXAMPLE 2
    /// The 'if let' statement declares a new variable 'unwrappedInput' and only allows the code
    /// to go into the if statement if 'unwrappedInput' is not nil; otherwise it skips the if statement.
    /// The compiler automatically infers that 'unwrappedInput' is of type Int rather than Int?
    func exampleUnwrapTheInputUsingOptionalBinding(input: Int?) -> Int {
        if let unwrappedInput = input {
            return unwrappedInput
        }

        // if input doesn't exist, default to 0
        return 0
    }

    /// EXAMPLE 3
    /// Note that in the following example, the unwrapped input can be the same name as the original
    /// input.
    ///
    /// Allen's Note: It's a bit contentious whether to use the same name or to prepend something like
    /// "unwrapped", but I believe using the same name is winning out the popularity battle amongst
    /// Swift developers.
    func exampleUnwrapTheInputUsingOptionalBinding2(input: Int?) -> Int {
        // Note: when using conditional unwrapping, your newly declared variable can be the
        // same name as your original variable. Within the scope of the if statement, all
        // references to 'input' will use the variable you declared and ignore the original
        // optional one.
        if let input = input {
            return input
        }

        return 0
    }

    /// EXAMPLE 4
    /// You can also use guard else statements, which just reverses the edge case handling
    /// to be inside the code block rather than outside like in the if case. Guard lets are
    /// better suited for cases where you are eliminating edge cases before jumping into
    /// more substantial logic.
    func exampleUnwrapTheInputUsingGuard(input: Int?) -> Int {
        guard let input = input else {
            return 0
        }

        // from here on out, we're using the 'input' variable declared by the 'guard' statement,
        // which has been unwrapped, so it's now of type Int, not Int?
        return input
    }
}
