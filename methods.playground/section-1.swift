// Playground - noun: a place where people can play

import Cocoa

class Counter {
    var count = 0
    
    func increment() {
        count++
    }
    
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5, numberOfTimes: 3)
counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveByX(deltaX: Double, y deltaY:Double) {
        self = Point(x: x+deltaX, y: y+deltaY)
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    println("This point to the right of the line where x == 1.0")
}

var otherPoint = Point(x: 1.0, y: 1.0)
otherPoint.moveByX(2.0, y: 3.0)
println("The point is now at (\(otherPoint.x), \(otherPoint.y))")

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
println(ovenLight.hashValue)
ovenLight.next()
println(ovenLight.hashValue)
ovenLight.next()
println(ovenLight.hashValue)

class SomeClass {
    class func someTypeMethod() {
        println("someTypeMethod is called.")
    }
}

SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockedLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int)->Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advancedToLevel(level: Int)->Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

var myLevel = LevelTracker()
myLevel.currentLevel = 2
LevelTracker.unlockedLevel(myLevel.currentLevel)
var isUnlocked = myLevel.advancedToLevel(myLevel.currentLevel)
if isUnlocked {
    println("this level is unlocked.")
} else {
    println("this level is locked.")
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func completedLevel(level: Int) {
        LevelTracker.unlockedLevel(level + 1)
        tracker.advancedToLevel(level+1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Arzhna")
player.completedLevel(1)
println("Highest unlocked level is now \(LevelTracker.highestUnlockedLevel).")

player = Player(name: "Beto")
player.completedLevel(6)
if player.tracker.advancedToLevel(6) {
    println("Player \(player.playerName) is now on level 6")
} else {
    println("Level 6 has not yet been unlocked.")
}












