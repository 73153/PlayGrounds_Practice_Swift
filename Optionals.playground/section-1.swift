/*NOTE
The concept of optionals doesn’t exist in C or Objective-C. The nearest thing in Objective-C is the ability to return nil from a method that would otherwise return an object, with nil meaning “the absence of a valid object.” However, this only works for objects—it doesn’t work for structs, basic C types, or enumeration values. For these types, Objective-C methods typically return a special value (such as NSNotFound) to indicate the absence of a value. This approach assumes that the method’s caller knows there is a special value to test against and remembers to check for it. Swift’s optionals let you indicate the absence of a value for any type at all, without the need for special constants.*/

/*NOTE
Trying to use ! to access a non-existent optional value triggers a runtime error. Always make sure that an optional contains a non-nil value before using ! to force-unwrap its value.*/

import UIKit

var str = "Optionals"

let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt()
// convertedNumber is inferred to be of type "Int?", or "optional Int

if convertedNumber {
    println("\(possibleNumber) has an integer value of \(convertedNumber!)")
} else {
    println("\(possibleNumber) could not be converted to an integer")
}
// prints "123 has an integer value of 123"

if let actualNumber = possibleNumber.toInt() {
    println("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    println("\(possibleNumber) could not be converted to an integer")
}
// prints "123 has an integer value of 123

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

/*NOTE
nil cannot be used with non-optional constants and variables. If a constant or variable in your code needs to be able to cope with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.*/

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

/*NOTE
Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a non-existent object. In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.*/

let possibleString: String? = "An optional string."
println(possibleString!) // requires an exclamation mark to access its value
// prints "An optional string."

let assumedString: String! = "An implicitly unwrapped optional string."
println(assumedString)  // no exclamation mark is needed to access its value
// prints "An implicitly unwrapped optional string.

if assumedString {
    println(assumedString)
}
// prints "An implicitly unwrapped optional string.

if let definiteString = assumedString {
    println(definiteString)
}
// prints "An implicitly unwrapped optional string."

/*NOTE
Implicitly unwrapped optionals should not be used when there is a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of a variable.*/