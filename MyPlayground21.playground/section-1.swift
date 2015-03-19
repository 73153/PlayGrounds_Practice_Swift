// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var someInts = Int[]()

someInts.count

someInts.append(3)

someInts

someInts = []

var threeDoubles = Double[](count: 3, repeatedValue: 0.0)

var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles


// Dictionaries

var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]



airports.count

airports["LHR"] = "London"


if let oldValue = airports.updateValue("Dublinsad", forKey: "DUB") {
    println("as \(oldValue).")
    oldValue
}

airports["APL"] = "Apple Intern"

airports

airports["APL"] = nil

airports

airports["DUB"] = nil

airports

if let removedValue = airports.removeValueForKey("TYO") {
    println("is \(removedValue)")
} else {
    println("aaaaa")
}


for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}

for airportName in airports.values {
    println("Airport name: \(airportName)")
}


let airportCodes = Array(airports.keys)

let airportNames = Array(airports.values)


var namesOfIntegers = Dictionary<Int, String>()

namesOfIntegers[16] = "sixteen"

namesOfIntegers = [:]

// “// namesOfIntegers is once again an empty dictionary of type Int, String”















