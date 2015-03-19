// Playground - noun: a place where people can play

import Cocoa

func sayHello(personName: String) -> String {
    return "Hello, " + personName + "!"
}
println(sayHello("Arzhna"))
println(sayHello("Brian"))

func halfOpenRangeLength(start:Int, end:Int) -> Int {
    return end - start
}
println(halfOpenRangeLength(1, 10))

func sayHelloWorld() -> String {
    return "Hello, World"
}
println(sayHelloWorld())

func sayGoodbye(personName: String) {
    println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

func printAndCount(stringToPrint: String) -> Int {
    println(stringToPrint)
    return countElements(stringToPrint)
}

func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}

printAndCount("hello, world")
printWithoutCounting("hello, world")

func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels=0, consonants=0, others=0
    for character in string {
        switch String(character).lowercaseString {
            case "a", "e", "i", "o", "u":
                ++vowels
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                ++consonants
            default:
                ++others
        }
    }
    return (vowels, consonants, others)
}
let total = count("some arbitary string! ")
println("\(total.vowels) vowels and \(total.consonants) consonants.")

func join(string s1:String, toString s2:String, withJoiner joiner:String = " ") -> String{
    return s1 + joiner + s2
}

join(string:"hello", toString:"world", withJoiner:", ")
join(string:"hello", toString:"world")

func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    return false
}

let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8, 19)

func alignRight(var string:String, count: Int, pad: Character) -> String {
    let amountToPad = count - countElements(string)
    for _ in 1...amountToPad{
        string = pad + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")

func swapToInts(inout a: Int, inout b: Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapToInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
var anotherMathFunction = multiplyTwoInts

println("Result : \(mathFunction(2,3))")
println("Result : \(anotherMathFunction(2,3))")

func printMathResult(mFunction: (Int, Int)->Int, a: Int, b: Int)
{
    println("Result : \(mFunction(a,b))")
}

printMathResult(addTwoInts, 5, 3)

func chooseStepFunction(backward: Bool) -> (Int)->Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)

while(currentValue != 0){
    println(currentValue)
    currentValue = moveNearerToZero(currentValue)
}
println(currentValue)










