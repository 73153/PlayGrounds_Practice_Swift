// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// Collection Types

// “Arrays and dictionaries in Swift are always clear about the types of values and keys that they can store”

// “An array stores multiple values of the same type in an ordered list”

var shoppingList: String[]

shoppingList


shoppingList = ["Eggs","aaa"]

println("The shopping list contains \(shoppingList.count) items")

if shoppingList.isEmpty {
    //
} else {
    
    //
}

shoppingList.append("ss")

shoppingList += "aaa"

shoppingList += ["aaaa", "sdfs", "fsdfs"]

var firstItem = shoppingList[0]

shoppingList[4...6] = ["nnn", "mmmm"]

shoppingList.insert("adsad",atIndex: 0)

shoppingList.removeAtIndex(0)

shoppingList.removeLast()


for item in shoppingList {
    println(item)
}

for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}


// var someInts: Int[]

// someInts

var someInts = Int[]()

someInts.count


















