/*NOTE
Swift’s Array type exhibits different behavior to other types when assigned to a constant or variable, or when passed to a function or method. For more information, see Mutability of Collections and Assignment and Copy Behavior for Collection Types.*/

import UIKit

var str = "Collection Types"

var shoppingList: String[] = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items

/* or 
var shoppingList = ["Eggs", "Milk"]
*/

/*NOTE
The shoppingList array is declared as a variable (with the var introducer) and not a constant (with the let introducer) because more items are added to the shopping list in the examples below.*/

println("The shopping list contains \(shoppingList.count) items.")
// prints "The shopping list contains 2 items.”

if shoppingList.isEmpty {
    println("The shopping list is empty.")
} else {
    println("The shopping list is not empty.")
}
// prints "The shopping list is not empty.”


shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes


shoppingList += "Baking Powder"
// shoppingList now contains 4 items



shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items


var firstItem = shoppingList[0]
// firstItem is equal to "Eggs”


shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs”


shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items

/*NOTE
You can’t use subscript syntax to append a new item to the end of an array. If you try to use subscript syntax to retrieve or set a value for an index that is outside of an array’s existing bounds, you will trigger a runtime error. However, you can check that an index is valid before using it, by comparing it to the array’s count property. Except when count is 0 (meaning the array is empty), the largest valid index in an array will always be count - 1, because arrays are indexed from zero.*/

shoppingList.insert("Maple Syrup", atIndex: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list

println(shoppingList)


let mapleSyrup = shoppingList.removeAtIndex(0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string

firstItem = shoppingList[0]
// firstItem is now equal to "Six eggs”

let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no cheese
// the apples constant is now equal to the removed "Apples" string

for item in shoppingList {
    println(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas


for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas

var someInts = Int[]()
println("someInts is of type Int[] with \(someInts.count) items.")
// prints "someInts is of type Int[] with 0 items.”


someInts.append(3)
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type Int[]

var threeDoubles = Double[](count: 3, repeatedValue: 0.0)
// threeDoubles is of type Double[], and equals [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
// anotherThreeDoubles is inferred as Double[], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as Double[], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

println(shoppingList)

//Dictionaries

var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]


// or
/*
var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
*/

println("The dictionary of airports contains \(airports.count) items.")
// prints "The dictionary of airports contains 2 items.”

airports["LHR"] = "London"
// the airports dictionary now contains 3 items

airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow”

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    println("The old value for DUB was \(oldValue).")
}
// prints "The old value for DUB was Dublin.”

if let airportName = airports["DUB"] {
    println("The name of the airport is \(airportName).")
} else {
    println("That airport is not in the airports dictionary.")
}
// prints "The name of the airport is Dublin International.”

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary


if let removedValue = airports.removeValueForKey("DUB") {
    println("The removed airport's name is \(removedValue).")
} else {
    println("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin International.”

for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}
// TYO: Tokyo
// LHR: London Heathrow

for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}
// Airport code: TYO
// Airport code: LHR

for airportName in airports.values {
    println("Airport name: \(airportName)")
}
// Airport name: Tokyo
// Airport name: London Heathrow

let airportCodes = Array(airports.keys)
// airportCodes is ["TYO", "LHR"]

let airportNames = Array(airports.values)
// airportNames is ["Tokyo", "London Heathrow"]

var namesOfIntegers = Dictionary<Int, String>()
// namesOfIntegers is an empty Dictionary<Int, String>

namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type Int, String

/*NOTE
It is good practice to create immutable collections in all cases where the collection’s size does not need to change. Doing so enables the Swift compiler to optimize the performance of the collections you create.*/






