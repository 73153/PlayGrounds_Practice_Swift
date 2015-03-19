// Playground - noun: a place where people can play

import UIKit

var str = "Methods"


//Instance Methods

class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int) {
        count += amount
    }
/*
    func incrementBy3(amount: Int) {
        count += amount
    }
*/
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.incrementBy(5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0


//Local and External Parameter Names for Methods

class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counter2 = Counter2()
counter2.incrementBy(5, numberOfTimes: 3)
// counter value is now 15

/*
func incrementBy3(amount3: Int, #numberOfTimes: Int) {
    count += amount3 * numberOfTimes
}
let counter3 = Counter2()
counter2.incrementBy3(5, numberOfTimes: 3)
*/

//Modifying External Parameter Name Behavior for Methods

//The self Property


/*NOTE
In practice, you don’t need to write self in your code very often. If you don’t explicitly write self, Swift assumes that you are referring to a property or method of the current instance whenever you use a known property or method name within a method. This assumption is demonstrated by the use of count (rather than self.count) inside the three instance methods for Counter.
The main exception to this rule occurs when a parameter name for an instance method has the same name as a property of that instance. In this situation, the parameter name takes precedence, and it becomes necessary to refer to the property in a more qualified way. You use the implicit self property to distinguish between the parameter name and the property name.

func increment() {
    self.count++
}
*/

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    println("This point is to the right of the line where x == 1.0")
}
// prints "This point is to the right of the line where x == 1.0”


//Modifying Value Types from Within Instance Methods

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX2(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX2(2.0, y: 3.0)
println("The point is now at (\(somePoint2.x), \(somePoint2.y))")
// prints "The point is now at (3.0, 4.0)

/*
let fixedPoint = Point2(x: 3.0, y: 3.0)
fixedPoint.moveByX2(2.0, y: 3.0)
// this will report an error
*/

//Assigning to self Within a Mutating Method

struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

//EASY
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight is now equal to .High
ovenLight.next()
// ovenLight is now equal to .Off

//Type Methods

/*NOTE
In Objective-C, you can define type-level methods only for Objective-C classes. In Swift, you can define type-level methods for all classes, structures, and enumerations. Each type method is explicitly scoped to the type it supports.*/

class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()


struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// prints "highest unlocked level is now 2”

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    println("player is now on level 6")
} else {
    println("level 6 has not yet been unlocked")
}
// prints "level 6 has not yet been unlocked”








