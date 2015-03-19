// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()


let vga = Resolution(width: 640, height: 480)


// “Unlike structures, class instances do not receive a default memberwise initializer. Initializers are described in more detail in Initialization.”



// “The same behavior applies to enumerations:

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    println("The remembered direction is still .West")
}
// prints "The remembered direction is still .West"
// When rememberedDirection is assigned the value of currentDirection, it is actually set to a copy of that value. Changing the value of currentDirection thereafter does not affect the copy of the original value that was stored in rememberedDirection.


let tenEighty = VideoMode()
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoEighty = tenEighty
alsoEighty.frameRate = 30.0

// tenEighty is now 30.0

// “It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:”

// ===

// !==
if tenEighty === alsoEighty {
    println("asdsd")
}


var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
var copiedAges = ages

copiedAges["Peter"] = 24
println(ages["Peter"])

// prints "23"

var a = [1, 2, 3]

var b = a

var c = a


println(a[0])

// 1

println(b[0])

// 1

println(c[0])

// 1

a[0] = 42

println(a[0])

// 42

println(b[0])

//42

println(c[0])

//42

// “However, if you append a new item to a, you do modify the array’s length. This prompts Swift to create a new copy of the array at the point that you append the new value. Henceforth, a is a separate, independent copy of the array.”


a.append(4)

a[0] = 777

println(a[0])

// 777

println(b[0])

// 42

println(c[0])

// 42

// Ensuring That an Array is Unique

b.unshare()

b[0] = -105

println(a[0])

// 777

println(b[0])

// -105

println(c[0])

// 42


var names = ["MOSH", "asdad", "sddd"]

var copiedNames = names.copy()

copiedNames[0] = "Mo"

println(names[0])

// prints "MOSH"





