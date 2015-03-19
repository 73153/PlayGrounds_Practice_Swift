// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// Control Flow


for index in 1...5 {
    println("\(index)")
}

// “In the example above, index is a constant whose value is automatically set at the start of each iteration of the loop. As such, it does not have to be declared before it is used. It is implicitly declared simply by its inclusion in the loop declaration, without the need for a let declaration keyword.”

let base = 3
let power = 10
var answer = 1
for  _ in 1...power {
    answer *= base
}

println("\(base) to the power of \(power) is \(answer)")

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    println("Hello, \(name)")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in  numberOfLegs {
    println("\(animalName)s have \(legCount) legs ")
}


for character in "Hello" {
    println(character)
}



let finalSquare = 25
var board = Int[](count: finalSquare + 1, repeatedValue: 0)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02

board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // Roll the dice
    if ++diceRoll == 7 { diceRoll = 1}
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}

println("Game over!")



do {
square += board[square]
if ++diceRoll == 7 { diceRoll = 1 }
square += diceRoll
} while square < finalSquare

println("Game over!")

// Conditional Statements

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf")
} else if temperatureInFahrenheit >= 86 {
    println("It's very warm.")
} else {
    println("It's not that cold. Wear a t-shit")
}

// “The final else clause is optional, however, and can be excluded if the set of conditions does not need to be complete:”


let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    println("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w":
println("\(someCharacter) is a consonant")
default:
println("\(someCharacter) is not a vowel")
}


// “Range Matching
// Values in switch cases can be checked for their inclusion in a range. This example uses number ranges to provide a natural-language count for “numbers of any size”

// Tuples

// “ Alternatively, use the underscore (_) identifier to match any possible value.”

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    println("(0, 0) is at the origin")
case (_, 0):
    println("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    println("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    println("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    println("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis of \(x)")
case (0, let y):
    println("on the y-axis of \(y)")
case (let x, let y):
    println("some else of (\(x), \(y))")
}



// Where

// “A switch case can use a where clause to check for additional conditions.”

// 不用default也可

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    println("\(x), \(y) is on  os")
case let (x, y) where x == -y:
    println("ddd")
case let (x, y):
    println("just")
}

// Control Transfer Statements

let puzzleInput = "great minds think alike"

var puzzleOutput = ""

for character in puzzleInput {
    switch character {
        case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput += character
    }
    
}

println(puzzleOutput)















