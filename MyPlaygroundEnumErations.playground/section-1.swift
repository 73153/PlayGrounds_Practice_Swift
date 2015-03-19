// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum SomeEnumeration {
    
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

// “Unlike C and Objective-C, Swift enumeration members are not assigned a default integer value when they are created. In the CompassPoints example above, North, South, East and West do not implicitly equal 0, 1, 2 and 3. Instead, the different enumeration members are fully-fledged values in their own right, with an explicitly-defined type of CompassPoint.”


var directionToHead = CompassPoint.West
directionToHead = .East

directionToHead = .South

switch directionToHead {
case .North:
    println("ss")
case .South:
    println("aa")
case .East:
    println("vv")
case .West:
    println("bb")
}

// Associated Values


