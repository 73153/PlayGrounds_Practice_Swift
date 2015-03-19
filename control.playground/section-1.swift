
for index in 1...5 {
    println("\(index) times 5 is \(index*5)")
}
println()

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
println("\(base) to the power of \(power) is \(answer).")

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    println("Hello, \(name)!")
}
println()

let numberOflegs = ["spider":8, "ant":6, "cat":4]
for (animalName, legCount) in numberOflegs {
    println("\(animalName)s have \(legCount) legs.")
}
println()

for character in "Hello" {
    println(character)
}
println()

for var index = 0; index < 3; ++index {
    println("index is \(index)")
}
println()

var index : Int
for index=0; index<3; ++index{
    println("index is \(index).")
}
println("The loop statements were executed \(index) times.")
println()

let finalSquare = 25
var board = Int[](count:finalSquare+1, repeatedValue: 0)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {
    if ++diceRoll == 7 {diceRoll = 1}
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    print("\(square) -> ")
}
println("Game Over\n")

square = 0
diceRoll = 0

do {
    if ++diceRoll == 7 { diceRoll = 1}
    square += diceRoll
    print("\(square) -> ")
} while square < finalSquare
println("Game Over\n")

func whatDoWearACloth(degree:Int){
    if degree <= 32 {
        println("It's very cold. Consider wearing a scarf.\n")
    }else if degree >= 86 {
        println("It's really warm. Don't forget to wear sunscreen.\n")
    }else{
        println("It's not that cold. Wear a t-shirts.\n")
    }
}

var temperatureInFahrenheit = 30
whatDoWearACloth(temperatureInFahrenheit)
temperatureInFahrenheit = 40
whatDoWearACloth(temperatureInFahrenheit)
temperatureInFahrenheit = 90
whatDoWearACloth(temperatureInFahrenheit)

func whatKindOfAlphabet(someCharacter:Character){
    switch someCharacter {
        case "a","e","i","o","u":
            println("\(someCharacter) is a vowel.")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p","q","r","s","t","v","w","x","y","z" :
            println("\(someCharacter) is consonant.")
        default:
            println("\(someCharacter) is not a alphabet.")
    }
}

let name = "arzhna1"

for ch in name {
    whatKindOfAlphabet(ch)
}
println()

let count = 3_000_000_000_000
let countedThings = "stars in the Milky Way"

func whatRangeAt(value:Int){
    var naturalCount: String
    
    switch value {
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
}

whatRangeAt(count)
whatRangeAt(10)

let somePoint = (1,1)
switch somePoint {
case (0,0):
    println("\(somePoint) is at origin.")
case (_,0):
    println("\(somePoint) is at x-line.")
case (0,_):
    println("\(somePoint) is at y-line.")
case (-2...2, -2...2):
    println("\(somePoint) is in a box.")
default:
    println("\(somePoint) is not in a box.")
}
println()

let anotherPoint = (2,0)
switch anotherPoint {
case (let x, 0):
    println("at x-line, x value is \(x).")
case (0, let y):
    println("at y-line, y value is \(y).")
case let (x,y):
    println("\(x),\(y)")
}
println()

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x,y) where x == y:
    println("\(yetAnotherPoint) is at x==y point.")
case let(x,y) where x == -y:
    println("\(yetAnotherPoint) is at x==-y point.")
case let(x,y):
    println("\(yetAnotherPoint) is at oter area.")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for ch in puzzleInput {
    switch ch {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput += ch
    }
}
println(puzzleOutput)
println()


square = 0
diceRoll = 0

gameLoop: while square != finalSquare {
    if ++diceRoll == 7 { diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square + board[square]
        print("\(square) -> ")
    }
}
println("Game Over")
println()






