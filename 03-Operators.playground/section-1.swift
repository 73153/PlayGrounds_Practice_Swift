// Playground - noun: a place where people can play

import Cocoa

// Operators are made up of one or more of the 
// following characters.
// /, =, -, +, !, *, %, <, >, &, |, ^, ~, and .

// The following operators are reserved and cannot
// be overloaded or used to define a custom operator.
// =, ->, //, /*, */, ., unary prefix &

var a: Int = 1
var b: Int = 2

// Binary Operator
a + b
a+b

// Must have space on each side of operator! The
// following are errors. Uncomment to see.
// a +b
// a- b

1 + 1
1 - 1
2 * 2
3 / 2       // Notice truncation - Int result
3.0 / 2.0
3.0 / 2
3 / 2.0

// Remainder Operator
let p = 11
let q = 2
let r = p % q

// Works with floating point numbers too!
let fp = 57.73
let fq = 33.18
let fr = fp % fq

// Tuple Assignment
let (fx, fy) = (100.25, 50.75)
fx
fy

// Unary Prefix Operator
++a

// Unary Postfix Operator
b--
b

// ****************************************

// Comaprison Operators

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

// ****************************************

// Range Operators
// Two types - closed range & open range

// Closed - range from 1 to 5
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

// Open - range from 1 to 4
for index in 1..5 {
    println("\(index) times 2 is \(index * 2)")
}

// ****************************************

// Logical Operators

let length = 10
let flag: Bool = false
flag == true
flag == false
flag != true
flag == true && length > 10
flag == false || length > 10






