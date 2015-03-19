// Playground - noun: a place where people can play

import UIKit

var str: String = "Hello, playground"


// Empty Strings
var emptyString = ""
var anotherEmptyString = String()

emptyString.isEmpty

// Mutability

var catName = "Kaydee"
var greeting = "Hello"
var message = ""

message = greeting
message += " " + catName

// Immutable Strings
let constantMessage = message
// ,constantMessage += " " + catName


struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

class Polyline {
    var points = Array<Point>()
}

let origin = Point(x: 0.0, y: 0.0)
let line = Polyline()

class Person {
    var name: String = ""
    init(var name: String) {
        self.name = name
    }
}

let pHenryFord = Person(name: "Henry Ford")
let pHenryFonda = Person(name: "Henry Fonda")
let pInventor = pHenryFord

pInventor === pHenryFord
pInventor !== pHenryFord

pInventor === pHenryFonda

pInventor.name = "Albert Einstein"

pInventor === pHenryFord
pInventor !== pHenryFord

var a1 = [1, 2, 3]
var a2 = Int[]([1, 2, 3])
var a3 = Array<Int>([1, 2, 3])

a1 === a2
a1 == a2

a1 === a3
a1 == a3

var b1 = a1
b1

a1 === b1

a1[0] = -1

a1
b1

a1.append(4)
b1.append(4)

a1 === b1
a1 == b1

a1
b1

var c = [1, 2, 3]
let d = c.unshare()

var v = c.unshare()




