// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


struct FixedLengthRange {
    var firstValue:Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

let range = FixedLengthRange(firstValue: 0, length: 4)

// range.firstValue = 6

// error

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    @lazy var importer = DataImporter()
    var data = String[]()
}

let manager = DataManager()

manager.data += "Some data"

manager.data += "Some more data"

// “Because it is marked with the @lazy attribute, the DataImporter instance for the importer property is only created when the importer property is first ”


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

var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))

let initalSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)

square.origin.x

square.origin.y

// “If a computed property’s setter does not define a name for the new value to be set, a default name of newValue is used”

// Read-only

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
    return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)



class StepCounter {
    var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
        println("About to set totalSteps to \(newTotalSteps)")
    }
    didSet {
        if totalSteps > oldValue  {
            println("Added \(totalSteps - oldValue) steps")
        }
    }
    }
}
let stepCounter = StepCounter()

struct SomeStructure {
    static var store = "Some Value"
    static var dsdad: Int {
    return 1
    }
}

enum sdd {
    static var s = "a"
}

class SomeClass {
    class var computr: Int {
    return 1
    }
}


struct AudioChannel {
    static let thre = 10
    static var asd = 0
    var currentlevel: Int = 0 {
    didSet{
        if currentlevel > AudioChannel.thre {
            currentlevel = AudioChannel.thre
        }
        if currentlevel > AudioChannel.asd {
            AudioChannel.asd = currentlevel
        }
    }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentlevel = 7


