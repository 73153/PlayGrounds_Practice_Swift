// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// closures
var numbers = [20, 19, 7, 12]

//  numbers.map({
//     number in 3*number
//    })

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })

sort(numbers) // 从小到大

numbers

sort(numbers) { $0 > $1 } //从大到小

numbers



// Objects and Classes

class NameShape{
    var numberOfSides: Int = 0
    var name: String
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = NameShape(name:"sada")

class Square: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String)
    {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0  //“the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.”
    }
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

var triangle = Square(sideLength: 3.1, name: "a")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

// test.area()
// test.simpleDescription()

/*
“Notice that the initializer for the EquilateralTriangle class has three different steps:

Setting the value of properties that the subclass declares.
Calling the superclass’s initializer.
Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.”

*/

class Counter {
    var count: Int = 0
    func incere(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
    
}

var counter = Counter()
counter.incere(2, numberOfTimes: 7)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

//Enumerations and Structures

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
            
        }
    }
}
// “Use the toRaw and fromRaw functions to convert between the raw value and the enumeration value.”
let ace = Rank.Ace
let aceRawValue = ace.toRaw()

if let convertedRank = Rank.fromRaw(3) {
    let threeDescription = convertedRank.simpleDescription()
}

// enumValue

//“When assigning a value to the hearts constant, the enumeration member Suit.Hearts is referred to by its full name because the constant doesn’t have an explicit type specified.”


//  “One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.”




