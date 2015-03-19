// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also"
    fallthrough
default:
    description += "an integer"
}

println(description)

// prints "The number 5 is a prime number, and also an integer.”


// “It then uses the fallthrough keyword to “fall into” the default case as well. ”

let finalSquare = 25
var board = Int[](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0


gameLoop: while square != finalSquare {
    if ++diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}

println("Game over!")

// “If the break statement above did not use the gameLoop label, it would break out of the switch statement, not the while statement. Using the gameLoop label makes it clear which control statement should be terminated.”

// “helps make the game’s logic clearer to read and understand.”
