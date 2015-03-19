import Cocoa

// short hand syntax
var items:String[] = ["bag", "laptop", "watch", "phone"]

// count
items.count

// is empty
items.isEmpty

// append
items.append("book")
items += "pen"

items.insert("ball", atIndex: 0)
items

// concatenation
var fruits = ["apple", "mango", "pineapple"]
fruits += items

// subscript syntax
fruits[0] = "grapes"
fruits

fruits[0..2] = ["dates"]
fruits

// removal
fruits.removeAtIndex(0)
fruits.removeLast()

// iteration
var numbers = ""
for (i,e) in enumerate(fruits) {
    numbers += String(i)
}
numbers

// initializer
var flags = Int[](count: 10, repeatedValue: 2)

// copy behaviour
var a = [1,2,3,4]
// copied by reference (unless the length is changed)
var b = a
var c = a
// change b[0] will change c[0] as both reference the same array
b[0] = 2
c[0]
// changing the length will however break this behaviour
b += 5
b[0] = 3
c[0]
