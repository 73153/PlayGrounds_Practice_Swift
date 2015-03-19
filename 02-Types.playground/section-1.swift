// Playground - noun: a place where people can play

import Cocoa

// Cannot change
let x: Int = 1
// x = 5

// Can change
var y: Int = x
y = 5

// ****************************************

// Two kinds of types
//
// Named types
//   A type that can be given a particular name when
//   it is defined.  Named types include classes,
//   structures, enumerations, and protocols.

var one:Double = 1.0
var myName:String = "Bennett"
enum Direction {
    case North
    case South
    case East
    case West
}

// ****************************************

// Compound types
//   A compound type is a type without a name, 
//   defined in the Swift language itself.
//   There are two compound types; function types
//   and tuple types.
//
//   A compound type may contain named types and
//   other compound types.

// Type Annotation - Explicitly specifies type of 
// variable or expression.

let someTuple: (Double, Double) = (3.14159, 2.71828)
func someFunction(a: Int) { /* ... */ }

// Tuple Type
// A comma-separated list of zero or more types, enclosed in parentheses.
(10.0, 20.0)

("National Debt", 1.0e1000)

(x: 100.0, y:50.0)

// Function Type
func displayMessage() -> Void {
    println("Hello, World")
}

displayMessage()

// ****************************************

// Array Type
// Swift uses square brackets ([]) immediately after the name of a type as
// syntactic sugar for the named type Array<T>, which is defined in the
// Swift standard library.

// These are equivalent
let someArray: String[] = ["Alex", "Brian", "Dave"]
let anotherArray: Array<String> = ["Alex", "Brian", "Dave"]

someArray[0]
someArray[1..3]
someArray[1]
someArray[2]


// fatal error: Negative Array index is out of range
// anotherArray[-1]

// fatal error: Array index out of range
// anotherArray[3]

// An empty array
var emptyArray: Double[] = []

// A multi-dimensional array
var array3D: Int[][][] = [
    [
        [1, 2],
        [3, 4]
    ],
    [
        [5, 6],
        [7, 8]
    ]
]

array3D[0]
array3D[1][0]
array3D[1][0][1]

// ****************************************

// Dictionary Type

// TODO: 

// ****************************************

// Optional Type
// Swifth uses the postfix ? operator as syntactic sugar for the named type Optional<T>,
// which is defined in the Swift standard library. The following are equivalent:
var optionalInteger: Int?
var anotherOptionalInteger: Optional<Int>

// If you don't provide an initial value for an optional variable or property, its value
// is automatically set to nil.

// Unwrapping an optional
optionalInteger = nil
optionalInteger = 42
optionalInteger!

// Type Inference

// These are the same, but one is less typing!
var explicitInteger: Int = 10
var inferedInteger = 10

var explicitString: String = "Hello"
var implicitString = "Hello"


// let foo:Int? = somefunc()




