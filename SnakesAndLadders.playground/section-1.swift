import Foundation

// Game board
let finalSquare = 25
var board = Int[](count: finalSquare + 1, repeatedValue: 0)

// Snakes
board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8

// Ladders
board[3] = 8; board[6] = 11; board[9] = 9; board[10] = 2

var (diceRoll, currentSquare) = (0, 0)
while currentSquare < finalSquare {
    diceRoll = Int(arc4random() % 6) + 1
    println("Dice Roll: \(diceRoll)")
    currentSquare += diceRoll
    if currentSquare < board.count {
        println("Landed on \(currentSquare)")
        let prevSquare = currentSquare
        currentSquare += board[currentSquare]
        if currentSquare < prevSquare {
            println("Ah! Snake! Going down to \(currentSquare)")
        }
        else if currentSquare > prevSquare {
            println("Yay! A ladder! Going up to \(currentSquare)")
        }
    }
}
println("Game over")