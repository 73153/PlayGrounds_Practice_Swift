// Playground - noun: a place where people can play

import UIKit

var str = "Basic operators"

let b = 10
var a = 5
a = b
// a is now equal to 10

let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2

/*
if x = y {
    // this is not valid, because x = y does not return a value
}
*/

if x == y {
    // this is valid, because x == y returns a value
}

1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0

"hello, " + "world"  // equals "hello, world"

let dog: Character = "🐶"
let cow: Character = "🐮"
let dogCow = dog + cow
// dogCow is equal to "🐶🐮"

9 % 4    // equals 1

-9 % 4   // equals -1

8 % 2.5   // equals 0.5

// Increment decrement operators
var i = 0
++i      // i now equals 1

var e = 0
let f = ++e
e
// e and f are now both equal to 1
let g = e++
e
// e is now equal to 2, but c has been set to the pre-increment value of 1

/*NOTE
“If the operator is written before the variable, it increments the variable before returning its value.
If the operator is written after the variable, it increments the variable after returning its value.*/

var k = 0
let l = ++k
k
// k and l are now both equal to 1
let m = k++
k
// k is now equal to 2, but c has been set to the pre-increment value of 1


let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three

let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6


var n = 1
n += 2
// n is now equal to 3


1 == 1   // true, because 1 is equal to 1
2 != 1   // true, because 2 is not equal to 1
2 > 1    // true, because 2 is greater than 1
1 < 2    // true, because 1 is less than 2
1 >= 1   // true, because 1 is greater than or equal to 1
2 <= 1   // false, because 2 is not less than or equal to 1

let name = "world"
if name == "world" {
    println("hello, world")
} else {
    println("I'm sorry \(name), but I don't recognize you")
}
// prints "hello, world", because name is indeed equal to "world"

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90

/* 
or
let contentHeight = 40
let hasHeader = true
var rowHeight = contentHeight
if hasHeader {
    rowHeight = rowHeight + 50
} else {
    rowHeight = rowHeight + 20
}
// rowHeight is equal to 90
*/


for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..count {
    println("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

/*
Logical NOT (!a)
Logical AND (a && b)
Logical OR (a || b)
*/

let allowedEntry = false
if !allowedEntry {
    println("ACCESS DENIED")
}
// prints "ACCESS DENIED”

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "ACCESS DENIED”

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "Welcome!”

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "Welcome!”

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}
// prints "Welcome!”

