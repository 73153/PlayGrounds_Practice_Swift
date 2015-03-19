
import Foundation
import Cocoa

// ********************
// for-in loop examples
// ********************
//
// General form is as follows:
//
// for <element> in <collection of items> {
//     <statements>
// }
//
// Collection of items may be...
//   - range of numbers
//   - items in an array or dictionary
//   - characters in a string

// Simple for-in

for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

// Ignoring value, just looping

let base = 3
let power = 10
var answer = 1
// Note '_' allows you to ignore the values in the range.
for _ in 1...power {
    answer *= base
}
println("\(base) to the power of \(power) is \(answer)")

// Looping over an array

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    println("Hello, \(name)")
}

// Looping over a dictionary

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}

for character in "Hello" {
    println(character)
}

// *************************************
// for-condition-increment loop examples
// *************************************
//
// General form is as follows:
//
// for <initialization>; <condition>; <increment> {
//     <statements>
// }

// Simple for-condition-increment loop

for var index = 0; index < 3; ++index {
    println("index is \(index)")
}

// With multiple variables

for var a = 10, b = 1; a > 0; a--, b++ {
    println("a is \(a), b is \(b)")
}

// *******************
// while loop examples
// *******************
//
// General form is as follows:
//
// while <condition> {
//     <statements>
// }

let candyBarCost = 1.00
var moneyInWallet = 6.85
var candyBarsPurchased = 0
while moneyInWallet > candyBarCost {
    moneyInWallet -= candyBarCost
    candyBarsPurchased++
}
println("You bought \(candyBarsPurchased) candy bars. Enjoy!")
println("You still have \(moneyInWallet) left in your wallet.")

// **********************
// do-while loop examples
// **********************
//
// General form is as follows:
//
// do {
//     <statements>
// } while <condition>

var candyBarsOnHand = candyBarsPurchased
do {
    // Eat candy bar
    candyBarsOnHand--
} while candyBarsOnHand > 0
println("You need more candy bars!")

// *********************
// if statement examples
// *********************
// 
// General form is as follows:
//
// if <condition> {
//     <statements>
// }
// else {
//     <statements>
// }
//
// May chain if statements together:
//
// if <condition> {
//     <statements>
// } else if <condition> {
//     <statements>
// } else if <condition> {
//     <statements>
// } else {
//     <statements>
// }
//
// Final else is optional, and may be dropped if not needed.
// Braces around statement blocks are required, unlike C.

// Simple if statement

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
}

// With else clause

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}

// Chained if statements

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    println("It's really warn. Don't forget to wear sunscreen.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}

// Omit trailing else clause

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    println("It's really warn. Don't forget to wear sunscreen.")
}
// Skips both, prints nothing.

// *************************
// switch statement examples
// *************************
//
// General form is as follows:
//
// switch <some value to consider> {
// case <value 1>:
//     <statements>
// case <value 2>:
//     <statements>
// case <value 3>:
//     <statements>
// default:
//     <statements>
// }
//
// Each case may match a specific value or a more comples matching pattern.
//
// Switch must be exhaustive - Every possible value of the type must 
// be matched by one of the switch cases.  Include 'default:' case if you 
// don't want to list all values explicitly.
//
// Case statements do not end with 'break', as in C.  There is no fall-through
// to case statements below.

// Simple switch on a character

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    println("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j",
     "k", "l", "m", "n", "p", "q", "r",
     "s", "t", "v", "w", "x", "y", "z":
    println("\(someCharacter) is a consonant")
default:
    println("\(someCharacter) is not a vowel or a consonant")
}

// Switch on numeric ranges

let count = 3_000_000_000_000
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}
println("There are \(naturalCount) \(countedThings).")

// Switching with tuples

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    println("(0, 0) is a thte origin")
case (_, 0):
    println("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    println("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    println("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    println("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// Note: first match always wins. It is okay to have multiple cases that match.
// Consider the point (0, 0)

// Value binding to local constants and variables in switch cases

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with a y value of \(y)")
case let (x, y):
    println("somewhere else at (\(x), \(y))")
}

// Where clause with case - check additional conditions

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    println("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    println("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    println("(\(x), \(y)) is just some arbitrary point")
}

// Swift provides four control transfer statements. They are
//   - continue
//   - break
//   - fallthrough
//   - return
// Refer to "The Swift Programming Language" for details.

// Some code examples are excerpt from: Apple Inc. “The Swift Programming Language.”
