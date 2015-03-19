// Playground - noun: a place where people can play

import Cocoa

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

class DataImporter {
    var fileName = "data.txt"
}

class DataManger {
    @lazy var importer = DataImporter()
    var data = String[]()
}

let manager = DataManger()
manager.data += "Some data"
manager.data += "Some more data"

println(manager.importer.fileName)

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
    get {
        let centerX = origin.x + (size.width / 2)
        let centerY = origin.y + (size.height / 2)
        return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
        origin.x = newCenter.x - (size.width / 2)
        origin.y = newCenter.y - (size.height / 2)
    }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
println("square.origin is now at (\(square.origin.x), \(square.origin.y))")

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
    get {
        let centerX = origin.x + (size.width / 2)
        let centerY = origin.y + (size.height / 2)
        return Point(x: centerX, y: centerY)
    }
    set {
        origin.x = newValue.x - (size.width / 2)
        origin.y = newValue.y - (size.height / 2)
    }
    }
}

var otherSquare = AlternativeRect(origin: Point(x:0, y:0), size: Size(width: 15, height: 15))
let otherInitialSquareCenter = otherSquare.center
otherSquare.center = Point(x:10, y:10)
println("otherSquare.origin is now at (\(otherSquare.origin.x), \(otherSquare.origin.y))")

struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

class StepCounter {
    var totalStep: Int = 0{
    willSet(newTotalSteps){
        println("About to set totalSteps to \(newTotalSteps)")
    }
    didSet{
        if totalStep > oldValue {
            println("Added \(totalStep - oldValue) steps")
        }
    }
    }
}

let stepCounter = StepCounter()
stepCounter.totalStep = 200
stepCounter.totalStep = 360
stepCounter.totalStep = 896

struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 2
    }
}

class SomeClass {
    class var computedTypeProperty: Int {
        return 42
    }
}

println(SomeClass.computedTypeProperty)
println(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another Value."
println(SomeStructure.storedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
    didSet {
        if currentLevel > AudioChannel.thresholdLevel {
            currentLevel = AudioChannel.thresholdLevel
        }
        if currentLevel > AudioChannel.maxInputLevelForAllChannels {
            AudioChannel.maxInputLevelForAllChannels = currentLevel
        }
    }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
println(leftChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
println(rightChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)

println("\(leftChannel.currentLevel)  \(rightChannel.currentLevel)")
