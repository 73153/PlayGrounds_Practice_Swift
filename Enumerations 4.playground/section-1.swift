// Playground - noun: a place where people can play

import UIKit

var str = "Enumerations"

enum SomeEnumeration {
    // enumeration definition goes here
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

/*NOTE

Unlike C and Objective-C, Swift enumeration members are not assigned a default integer value when they are created. In the CompassPoints example above, North, South, East and West do not implicitly equal 0, 1, 2 and 3. Instead, the different enumeration members are fully-fledged values in their own right, with an explicitly-defined type of CompassPoint.*/

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East

directionToHead = .South
switch directionToHead {
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}
// prints "Watch out for penguins
/*NOTE
Consider the value of directionToHead. In the case where it equals .North, print "Lots of planets have a north". In the case where it equals .South, print "Watch out for penguins".*/


let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    println("Mostly harmless")
default:
    println("Not a safe place for humans")
}
// prints "Mostly harmless”

//Associated Values

enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let identifier, let check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case .QRCode(let productCode):
    println("QR code with value of \(productCode).")
}
// prints "QR code with value of ABCDEFGHIJKLMNOP."

switch productBarcode {
case let .UPCA(numberSystem, identifier, check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case let .QRCode(productCode):
    println("QR code with value of \(productCode).")
}
// prints "QR code with value of ABCDEFGHIJKLMNOP.”

//Raw Values

enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet2: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthsOrder = Planet2.Earth.toRaw()
// earthsOrder is 3

let possiblePlanet = Planet2.fromRaw(7)
// possiblePlanet is of type Planet? and equals Planet.Uranus

let positionToFind = 9
if let somePlanet = Planet2.fromRaw(positionToFind) {
    switch somePlanet {
    case .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
} else {
    println("There isn't a planet at position \(positionToFind)")
}
// prints "There isn't a planet at position 9”












