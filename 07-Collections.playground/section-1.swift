// Playground - noun: a place where people can play

import Cocoa
// *****
// Array
// *****

// Stores multiple values of the same type in an ordered list.
// Elements must all be of same type.

Array<Int>()
Int[]()

// Literal
[ "Dog", "Cat", "Bird", "Snake" ]

var pets: String[] = [ "Dog", "Cat", "Bird", "Snake" ]
// Could leave off the type - will be inferred.

// Number of elements in array

pets.count

// Checkif if array is empty (Same as for strings)

pets.isEmpty

// Adding items to an array

pets.append("Fish")
pets

pets += "Horse"
pets

pets.count
pets[0]
pets[pets.count-1]

// Changing items in an array

pets[4] = "Guppy"
pets.insert("Hampster", atIndex: 2)

// Removing elements from an array
pets.removeAtIndex(0)
pets.removeLast()

// Iterating over an array

for pet in pets {
    println(pet)
}

for (index, value) in enumerate(pets) {
    println("\(index + 1): \(value)")
}

// Clearing all items from an array
pets = []
pets.removeAll(keepCapacity: false)

// Creating an array that is pre-initialized with a known value
var lotsOfPie = Array<Double>(count: 10, repeatedValue: 3.1415)

// Mutability
let numbers = [1, 2, 3, 4, 5]

// Oddly, permitted even though numbers is a constant
numbers[1] = 10

// Error - would change size
// numbers.append(10)

var a1 = numbers
var a2 = a1

a1
a2

a1 === a2

a1.append(100)

a1
a2

a1 === a2

a1.removeLast()

a1
a2

a1 === a2
a1 == a2


// **********
// Dictionary
// **********

// Stores multiple values of the same type.
// Each value is associated with a unique key.
// No specific order to elements.
// Both key and value are of fixed (specific) types.

// Type expressed like this:
Dictionary<String, Double>(minimumCapacity: 10)

// Literal dictionary
["TKO": "Tokyo", "DUB": "Dublin"]

var airports: Dictionary<String, String> = ["TKO": "Tokyo", "DUB": "Dublin"]

// How many key/value pairs in the dictionary?

airports.count

// Adding new key/value pairs

airports["OAK"] = "Oakland"
airports.updateValue("San Francisco", forKey: "SFO")
airports

// Retrieving values from dictionary

if let airportName = airports["DEN"] {
    println("Found \(airportName)")
} else {
    println("Airport not found.");
}

if let airportName = airports["SFO"] {
    println("Found \(airportName)")
} else {
    println("Airport not found.")
}

// Removing a key/value pair

airports["SFO"] = nil

airports.removeValueForKey("OAK")

airports
airports.count

// Iterating a dictionary

for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}

// Just the keys
for key in airports.keys {
    println("\(key)")
}

// Just the values
for value in airports.values {
    println("\(value)")
}

// Creating empty dictionary

var dict = Dictionary<Int, String>()
dict[10] = "Ten"

// Removing all elements from dictionary (Either one)
dict = [:]
dict.removeAll(keepCapacity: false)

// Mutability

let d1 = [ "One": 1, "Ten": 10, "Hundred": 100 ]

// Not permitted to change values in constant dictionary
// This is different from array behavior!
// d1["One"] = 2

var dv1 = d1
var dv2 = d1

dv1 == dv2

dv1["Thousand"] = 1000

dv1 == dv2

dv1
dv2

dv1.removeValueForKey("Thousand")

dv1 == dv2

dv1
dv2







