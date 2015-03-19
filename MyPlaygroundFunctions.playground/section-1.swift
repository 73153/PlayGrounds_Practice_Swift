// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// Functions

func someFunction(externalParameterName localParameter: Int)
{
    
}

func join(string s1:String, toString s2:String, withJoiner joiner:String) -> String {
    return s1 + joiner + s2
}


join(string: "hello", toString: "world", withJoiner: ",")


func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    return false
}

let containsAVee = containsCharacter(string: "asdadvzcx", characterToFind: "v")


func joiner(string s1: String, toString s2: String, withJoiner joiner:String = " ") -> String {
    return s1 + joiner + s2
}

joiner(string: "hello", toString: "world", withJoiner: "-")

joiner(string: "hello", toString: "world")



func arithmeticMan(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMan(1, 2, 3, 4, 5)

arithmeticMan(3, 8, 19)

func alignRight(var string: String, count:Int, pad:Character) -> String {
    let amountToPad = count - countElements(string)
    for _ in 1...amountToPad {
        string = pad + string
    }
    return string
}

let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")

// paddedString is equal to "-----hello"
// originalString is still equal to "hello”

// “The variable parameter only exists for the lifetime of that function call.”

func swapTwoInts(inout a:Int, inout b:Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}


var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)

someInt
anotherInt


func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)





