// Playground - noun: a place where people can play

import Cocoa

struct Resolution
{
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

println("The width of someResoultion is \(someResolution.width)")

someVideoMode.resolution.width = 1280

println("The width of someVideoMode is \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
println("cinema is now \(cinema.width) pixels wide")
println("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case North, South, East, West
}

var currentDicrection = CompassPoint.West
let rememveredDirection = currentDicrection
currentDicrection = .East

if rememveredDirection == .West {
    println("The remembered direction is still .West")
}

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

if tenEighty === alsoTenEighty {
    println("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}

var ages = ["Peter":23, "Wei":35, "Anish":65, "Katya":19]
var copiedAges = ages

copiedAges["Peter"] = 24
println(ages["Peter"])

var a = [1, 2, 3]
var b = a
var c = a

println("\(a[0]) \(b[0]) \(c[0])")

a[0] = 42

println("\(a[0]) \(b[0]) \(c[0])")

a.append(4)
a[0] = 777

println("\(a[0]) \(b[0]) \(c[0])")

b.unshare()

b[0] = -105

println("\(a[0]) \(b[0]) \(c[0])")

if b === c {
    println("b and c still share the same array elements.")
} else {
    println("b and c now refer to two independent sets of array elements.")
}

if b[0...1] === b[0...1] {
    println("These two subarrays share the same array elements.")
} else {
    println("These two subarrays do not share the same array elements.")
}

var names = ["Mohsen", "Hilary", "Justyn", "Amy", "Rich", "Graham", "Vic"]

var copiedNames = names.copy()

copiedNames[0] = "Mo"

println("\(names[0]), \(copiedNames[0])")




