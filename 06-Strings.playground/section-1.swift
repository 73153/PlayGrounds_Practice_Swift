// Playground - noun: a place where people can play

import Cocoa

// Saw basics of string literals before.  Reminder:

let message = "My name is \"Bennett\"";

let interpolatedString = "2 + 2 = \(2+2)"

var str = "Hello, playground"

// Unicode strings
let dollarSign = "\x24"
let blackHeart = "\u2665"
let sparklingHeart = "\U0001F496"

// Initializing empty string
var emptyString = ""
var anotherEmptyString = String()

// Testing for empty string
emptyString.isEmpty
sparklingHeart.isEmpty

// Mutability
let first = "Bennett"
let last = "Smith"
let fullName = first + " " + last

var properName = "Mr. "
properName += fullName

// Strings are value types. Their values are copied, not shared.
var s1 = "Hello"
var s2 = s1
s2 = "Goodbye"
s1
s2

// Elements of string are of type Character. Can iterate them.
for char in "Dog!🐶" {
    println(char)
}

// Counting characters in a string.
//   - full unicode string - each character can take a different size
//   - use global countElements function

countElements(properName)
countElements(sparklingHeart)

// Concatenation
//
// Examples above.  Either use + or += to concatenate.
// Works with Character type too.

// String Equality

first == "Bennett"
first != "Henry"

first.hasPrefix("ben")
first.hasPrefix("Ben")

first.hasSuffix("tt")

// Case conversion

first.uppercaseString
first.lowercaseString

// Accessing individual Unicode code units or scalars
println("")
let dogString = "Dog!🐶"
for codeUnit in dogString.utf8 {
    println("\(codeUnit)")
}
println("")

for codeUnit in dogString.utf16 {
    println("\(codeUnit)")
}

println("")
for scalar in dogString.unicodeScalars {
    println("\(scalar.value)")
}





