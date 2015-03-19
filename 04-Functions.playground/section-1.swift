// Playground - noun: a place where people can play

import Cocoa

var message: String?

// Simple function, changing global variable
func assignMessage() -> Void {
    message = "Hello from a function"
}
assignMessage()

message

// ****************************************

// Simple function, returning a string
func returnMessage() -> String {
    return "Hello from a different function"
}
returnMessage()

// ****************************************

// Returning computed value
func addTwoNumbers(a: Int, b: Int) -> Int {
    return a + b
}

addTwoNumbers(10, 10)

// ****************************************

// Function parameter is constant!
func tryToChangeValue(val: Int) {
    // val = val + 10
}
tryToChangeValue(10)

// ****************************************

// Locally scoped variable can be changed
func changeValueLocally(var val: Int) {
    val = val + 10
}

var v = 10
changeValueLocally(v)
v

// ****************************************

// Passing parameter by reference
func changeValueByReference(inout val: Int) {
    val = val + 10
}

var v2 = 10
changeValueByReference(&v2)
v2

// ****************************************

// Named parameter with default value!
func sayHelloTo(name n:String = "me") -> String {
    return "Hello, \(n)"
}

sayHelloTo()
sayHelloTo(name: "Bennett Smith")

// ****************************************

// Variadic parameters & function overloading
func computeSum(numbers: Int[]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

let s1 = computeSum([6, 3, 4, 10, 92])
s1

func computeSum(numbers:Int ...) -> Int {
    return computeSum(numbers)
}

let s2 = computeSum(6, 3, 4, 10, 92)
s2

func computeAverage(numbers: Int[]) -> Double {
    var sum = computeSum(numbers)
    return Double(sum) / Double(numbers.count)
}

let a1 = computeAverage([ 6, 3, 4, 10, 92 ])
a1

func computeAverage(numbers:Int ...) -> Double {
    return computeAverage(numbers)
}

let a2 = computeAverage(6, 3, 4, 10, 92)
a2

// ****************************************

// Returning an anonymous tuple
func computeStats(numbers:Int ...) -> (Int, Int, Double) {
    let sum = computeSum(numbers)
    let avg = computeAverage(numbers)
    let count = numbers.count
    return (count, sum, avg)
}

let stats = computeStats(6, 3, 4, 10, 92)
println("count = \(stats.0), sum = \(stats.1), average = \(stats.2)")

// ****************************************

// Returning an named tuple
func computeStatsReturningNamedTuple(numbers:Int ...) -> (count: Int, sum:Int, average:Double) {
    let sum = computeSum(numbers)
    let avg = computeAverage(numbers)
    let count = numbers.count
    return (count, sum, avg)
}

let namedStats = computeStatsReturningNamedTuple(6, 3, 4, 10, 92)
println("count = \(namedStats.count), sum = \(namedStats.sum), average = \(namedStats.average)")


