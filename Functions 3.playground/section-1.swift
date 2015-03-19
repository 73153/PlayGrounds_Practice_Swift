// Playground - noun: a place where people can play

import UIKit

var str = "Functions"

func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}


println(sayHello("Anna"))
// prints "Hello, Anna!"
println(sayHello("Brian"))
// prints "Hello, Brian!

func sayHelloAgain(personName: String) -> String {
    return "Hello again, " + personName + "!"
}
println(sayHelloAgain("Anna"))
// prints "Hello again, Anna!

//Multiple Input Parameters
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
println(halfOpenRangeLength(1, 10))
// prints "9”

//Functions Without Parameters

func sayHelloWorld() -> String {
    return "hello, world"
}
println(sayHelloWorld())
// prints "hello, world"


//“Functions Without Return Values

func sayGoodbye(personName: String) {
    println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!”


/*NOTE
Strictly speaking, the sayGoodbye function does still return a value, even though no return value is defined. Functions without a defined return type return a special value of type Void. This is simply an empty tuple, in effect a tuple with zero elements, which can be written as ().*/


func printAndCount(stringToPrint: String) -> Int {
    println(stringToPrint)
    return countElements(stringToPrint)
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting("hello, world")
// prints "hello, world" but does not return a value”

/*NOTE
Return values can be ignored, but a function that says it will return a value must always do so. A function with a defined return type cannot allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.*/


//Functions with Multiple Return Values

func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string
    {
        switch String(character).lowercaseString
            {
            case "a", "e", "i", "o", "u": ++vowels
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z": ++consonants
            default: ++others
        }
    }
    return (vowels, consonants, others)
}
let total = count("some arbitrary string!")
println("\(total.vowels) vowels and \(total.consonants) consonants")
// prints "6 vowels and 13 consonants”

//Function Parameter Names

func someFunction(parameterName: Int) {
    // function body goes here, and can use parameterName
    // to refer to the argument value for that parameter
}


//External Parameter Names
func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
}

/*NOTE

If you provide an external parameter name for a parameter, that external name must always be used when calling the function.*/

func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}

join("hello", "world", ", ")
// returns "hello, world”

func join(string s1: String, toString s2: String, withJoiner joiner: String)
    -> String {
        return s1 + joiner + s2
}

join(string: "hello", toString: "world", withJoiner: ", ")
// returns "hello, world”

/*NOTE
Consider using external parameter names whenever the purpose of a function’s arguments would be unclear to someone reading your code for the first time. You do not need to specify external parameter names if the purpose of each parameter is clear and unambiguous when the function is called.*/

func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    return false
}

let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")
// containsAVee equals true, because "aardvark" contains a "v”


//Default Parameter Values

/*NOTE
Place parameters with default values at the end of a function’s parameter list. This ensures that all calls to the function use the same order for their non-default arguments, and makes it clear that the same function is being called in each case.*/

func join2(string s1: String, toString s2: String,
    withJoiner joiner: String = " ") -> String {
        return s1 + joiner + s2
}

join2(string: "hello", toString: "world", withJoiner: "-")
// returns "hello-world”

join2(string: "hello", toString: "world")
// returns "hello world”

//External Names for Parameters with Default Values

func join3(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}

join3("hello", "world", joiner: "-")
// returns "hello-world”

/*NOTE
You can opt out of this behavior by writing an underscore (_) instead of an explicit external name when you define the parameter. However, external names for defaulted parameters are always preferred where appropriate.*/

//Variadic Parameters

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8, 19)
// returns 10.0, which is the arithmetic mean of these three numbers

/*NOTE
A function may have at most one variadic parameter, and it must always appear last in the parameter list, to avoid ambiguity when calling the function with multiple parameters.
If your function has one or more parameters with a default value, and also has a variadic parameter, place the variadic parameter after all the defaulted parameters at the very end of the list.*/

//Constant and Variable Parameters

func alignRight(var string: String, count: Int, pad: Character) -> String {
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

/*NOTE
The changes you make to a variable parameter do not persist beyond the end of each call to the function, and are not visible outside the function’s body. The variable parameter only exists for the lifetime of that function call.*/

//In-Out Parameters

/*NOTE
In-out parameters cannot have default values, and variadic parameters cannot be marked as inout. If you mark a parameter as inout, it cannot also be marked as var or let.*/

func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}


var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3”

/*NOTE
In-out parameters are not the same as returning a value from a function. The swapTwoInts example above does not define a return type or return a value, but it still modifies the values of someInt and anotherInt. In-out parameters are an alternative way for a function to have an effect outside of the scope of its function body.*/

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    println("hello, world")
}

//Using Function Types
var mathFunction: (Int, Int) -> Int = addTwoInts

println("Result: \(mathFunction(2, 3))")
// prints "Result: 5”


mathFunction = multiplyTwoInts
println("Result: \(mathFunction(2, 3))")
// prints "Result: 6”

let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int

//Function Types as Parameter Types

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// prints "Result: 8”

func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

println("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")
// 3...
// 2...
// 1...
// zero!


//Nested Functions

func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!




