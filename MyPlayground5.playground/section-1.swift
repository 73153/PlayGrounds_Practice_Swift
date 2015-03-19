// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// Language Guide

//“Optionals are an example of the fact that Swift is a type safe language. ”“This enables you to catch and fix errors as early as possible in the development process.”

// Constants and Variables

// “The value of a constant cannot be changed once it is set, whereas a variable can be set to a different value in the future.”

// “Declaring Constants and Variables”

// Type Annotations

// “Naming Constants and Variables”

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
🐶🐮
var 👦 = "boy 👩"

👦

// “Once you’ve declared a constant or variable of a certain type, you can’t redeclare it again with the same name, or change it to store values of a different type. “ Nor can you change a constant into a variable or a variable into a constant.”


// Printing Constants and Variables


// Comments

// Semicolons

// “Semicolons are required, however, if you want to write multiple separate statements on a single line:”


let cat = "🐱"; println(cat)

// Integers

// Integer Bounds

let minValue = Int.min
let maxValue = Int.max

let minValue1 = UInt8.min
let maxValue2 = UInt8.max

let minValue3 = Int32.min
let maxValue4 = Int32.max

// “Swift always chooses Double (rather than Float) when inferring the type of floating-point numbers.”


// Numeric Literals

let oneMillion = 1_000_000.000_000_1

// Numeric Type Conversion

let cannotBeNegative: UInt8 = 2


let twoThousand: UInt16 = 2_000

let one: UInt8 = 1

let twoThousandAndOne = twoThousand + UInt16(one)


// Interger and Floating-Point Conversion

let pointOneFourOneFiveNine = 0.14159

let pi = 3.1415926

let interger = Int(pi)

// “integerPi equals 3, and is inferred to be of type Int”


// Type Aliases

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min

// “Here, AudioSample is defined as an alias for UInt16. Because it is an alias, the call to AudioSample.min actually calls UInt16.min, which provides an initial value of 0 for the maxAmplitudeFound variable.”


// Booleans

// “ As with Int and Double above, you don’t need to declare constants or variables as Bool if you set them to true or false as soon as you create them.”

let ods = true

let i = 1
// if i {
    
//}

// “this example will not compile, and will report an error”

if i == 1 {
    // “this example will compile successfully”
}


// Tuples


let http404Error = (404, "Not Found")

// “You can decompose a tuple’s contents into separate constants or variables, which you then access as usua”

let (statusCode, statusMessage) = http404Error

println("The status code is \(statusCode)")


// “If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:”


let (justTheStatusCode, _) = http404Error
println("The status code is \(justTheStatusCode)")


// “Alternatively, access the individual element values in a tuple using index numbers starting at zero”

println("The status code is \(http404Error.0)")


// “You can name the individual elements in a tuple when the tuple is defined”

let http200Status = (statusCode: 200, description: "OK")


println("The status code is \(http200Status.statusCode)")

println("The status message is \(http200Status.description)")


// Optionals

let possibleNumber = "123"

let covertedNumber = possibleNumber.toInt()

// convertedNumber is inferred to be of type "Int?", or "optional Int”

// “ it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int.”

// “If Statements and Forced Unwrapping”

// “You can use an if statement to find out whether an optional contains a value. If an optional does have a value, it evaluates to true; if it has no value at all, it evaluates to false.”

if covertedNumber {
    println("\(possibleNumber) has an integer value of \(covertedNumber!)")
} else {
    println("\(possibleNumber) could not be converted to an integer")
}

// Optional Binding

// “Optional binding can be used with if and while statements to check for a value inside an optional, and to extract that value into a constant or variable, ”


if let actualNumber = possibleNumber.toInt() {
    println("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    println("aaa")
}

//  prints "123 has an integer value of 123”


// if success 

// or else

// nil

var serverResponseCode: Int? = 404

serverResponseCode = nil

serverResponseCode = 1

// serverResponseCode now contains no value”

// “nil cannot be used with non-optional constants and variables. If a constant or variable in your code needs to be able to cope with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.”




// “Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a non-existent object. In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.”

var surveyAnswer: String?


// Implicitly Unwrapped Optionals


// “If you try to access an implicitly unwrapped optional when it does not contain a value, you will trigger a runtime error. The result is exactly the same as if you place an exclamation mark after a normal optional that does not contain a value.”


// “You can still treat an implicitly unwrapped optional like a normal optional, to check if it contains a value:”


if serverResponseCode {
    let a = 1
}

if let defin = surveyAnswer {
    defin
}


// surveyAnswer is nil , so if can't access


// Assertions

// “, you can trigger an assertion in your code to end code execution and to provide an opportunity to debug the cause of the absent or invalid value.”

// Debugging with Assertions

let age = -3

assert(age >= 0, "A person's age cannot be less than zero!")


// “Assertion messages cannot use string interpolation.”


// When to Use Assertions: possibles

/* “An integer subscript index is passed to a custom subscript implementation, but the subscript index value could be too low or too high.”
   “A value is passed to a function, but an invalid value means that the function cannot fulfill its task.”
   “An optional value is currently nil, but a non-nil value is essential for subsequent code to execute successfully.”
*/











