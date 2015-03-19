// Playground - noun: a place where people can play

import Cocoa

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
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

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    println("Mostly harmless")
default:
    println("Not a safe place of humans")
}

enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909_51226, 3)

//productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let identifier, let check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case .QRCode(let productCode):
    println("QR code with value of \(productCode).")
}

enum ASCIIControlCharacter: Character
{
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

let tab = ASCIIControlCharacter.Tab
println("aa" + tab.toRaw() + "bb")

let earthsOrder = Planet.Earth.toRaw()
let possiblePlanet = Planet.fromRaw(7)

let positionToFind = 9
if let somePlanet = Planet.fromRaw(positionToFind)
{
    switch somePlanet {
    case .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
}else{
    println("There isn't a planet at position \(positionToFind)")
}



