// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// Basic Operators

// Terminology

// Assignment Operator


let (x, y) = (1, 2)

x

y

// “Unlike the assignment operator in C and Objective-C, the assignment operator in Swift does not itself return a value. The following statement is not valid:”

//if x = y {
    // “this is not valid, because x = y does not return a value”
//}

// Arithmetic Operators

// “Unlike the arithmetic operators in C and Objective-C, the Swift arithmetic operators do not allow values to overflow by default. You can opt in to value overflow behavior by using Swift’s overflow operators (such as a &+ b)”

var a = 2
var b = 3

let dog: Character = "😱"
let cow: Character = "😨"
let dogcow = dog + cow

dog


9 % 4

-9 % 4

// Floating-Point Remainder Calculations

// “Unlike the remainder operator in C and Objective-C, Swift’s remainder operator can also operate on floating-point numbers”

8 % 2.5


// “Increment and Decrement Operators”

// Unary Minus Operator

let three = 3
let minusThree = -three
let plusThree = -minusThree

// Unary Plus Operator

// Compound Assignment Operators

var test = 3
test += 1

// Compraison Operators

let name = "world"

if name == "world" {
    println("Hello world!")
} else {
    println("sorry")
}


// Ternary Conditional Operator

// Range Operators

// Closed Range Operator

for index in 1...5 {
    index
}

// Half-Closed Range Operator

// “Half-closed ranges are particularly useful when you work with zero-based lists such as arrays, where it is useful to count up to (but not including) the length of the list”

let names = ["Anna", "Alex", "brian", "Jack"]
let count = names.count
for i in 0..count {
    names[i]
}

// Logical Operators

// Combining Logical Operators

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}

// “be read as:        If we’ve entered the correct door code and passed the retina scan; or if we have a valid door key; or if we know the emergency override password, then allow access.


// Explicit Parentheses












