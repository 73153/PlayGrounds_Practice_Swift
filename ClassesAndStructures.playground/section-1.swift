/*NOTE
An instance of a class is traditionally known as an object. However, Swift classes and structures are much closer in functionality than in other languages, and much of this chapter describes functionality that can apply to instances of either a class or a structure type. Because of this, the more general term instance is used.*/

/*NOTE
Structures are always copied when they are passed around in your code, and do not use reference counting.*/


import UIKit

var str = "Classes and Structures"


class SomeClass {
    // class definition goes here
}
struct SomeStructure {
    // structure definition goes here
}

/*NOTE
Whenever you define a new class or structure, you effectively define a brand new Swift type. Give types UpperCamelCase names (such as SomeClass and SomeStructure here) to match the capitalization of standard Swift types (such as String, Int, and Bool). Conversely, always give properties and methods lowerCamelCase names (such as frameRate and incrementCount) to differentiate them from type names.*/

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



//Accessing Properties
println("The width of someResolution is \(someResolution.width)")
// prints "The width of someResolution is 0”

println("The width of someVideoMode is \(someVideoMode.resolution.width)")
// prints "The width of someVideoMode is 0”

someVideoMode.resolution.width = 1280
println("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// prints "The width of someVideoMode is now 1280”

/*NOTE
Unlike Objective-C, Swift enables you to set sub-properties of a structure property directly. In the last example above, the width property of the resolution property of someVideoMode is set directly, without your needing to set the entire resolution property to a new value.*/

let vga = Resolution(width: 640, height: 480)

//Structures and Enumerations Are Value Types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

println("cinema is now \(cinema.width) pixels wide")
// prints "cinema is now 2048 pixels wide”

println("hd is still \(hd.width) pixels wide")
// prints "hd is still 1920 pixels wide”

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    println("The remembered direction is still .West")
}
// prints "The remembered direction is still .West”

//Classes Are Reference Types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// prints "The frameRate property of tenEighty is now 30.0”

//Identity Operators

if tenEighty === alsoTenEighty {
    println("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}
// prints "tenEighty and alsoTenEighty refer to the same Resolution instance.”

/*NOTE that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):

Identical to (===) means that two constants or variables of class type refer to exactly the same class instance.
Not identical to (!==)

"Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.
*/



//Assignment and Copy Behavior for Collection Types
    
/*NOTE
The descriptions below refer to the “copying” of arrays, dictionaries, strings, and other values. Where copying is mentioned, the behavior you see in your code will always be as if a copy took place. However, Swift only performs an actual copy behind the scenes when it is absolutely necessary to do so. Swift manages all value copying to ensure optimal performance, and you should not avoid assignment to try to preempt this optimization.*/

var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
var copiedAges = ages

copiedAges["Peter"] = 24
println(ages["Peter"])

println(copiedAges["Peter"])

// prints "23”


//Assignment and Copy Behavior for Arrays

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
// 42
println(c[0])
// 42


a.append(4)
println(a)
a[0] = 777
println(a)
println(a[0])
// 777
println(b[0])
// 42
println(c[0])
// 42



//Ensuring That an Array Is Unique

b.unshare()
println(b)
b[0] = -105
println(b)
println(a[0])
// 777
println(b[0])
// -105
println(c[0])
// 42


//Checking Whether Two Arrays Share the Same Elements

if b === c {
    println("b and c still share the same array elements.")
} else {
    println("b and c now refer to two independent sets of array elements.")
}
// prints "b and c now refer to two independent sets of array elements.”


if b[0...1] === b[0...1] {
    println("These two subarrays share the same elements.")
} else {
    println("These two subarrays do not share the same elements.")
}
// prints "These two subarrays share the same elements.”



//Forcing a Copy of an Array

var names = ["Mohsen", "Hilary", "Justyn", "Amy", "Rich", "Graham", "Vic"]
var copiedNames = names.copy()

copiedNames[0] = "Mo"
println(names[0])
println(copiedNames[0])

// prints "Mohsen”

/*NOTE
If you simply need to be sure that your reference to an array’s contents is the only reference in existence, call the unshare method, not the copy method. The unshare method does not make a copy of the array unless it is necessary to do so. The copy method always copies the array, even if it is already unshared.*/




