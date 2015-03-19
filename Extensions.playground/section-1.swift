// Playground - noun: a place where people can play

import UIKit

var str = "Extensions"

/*NOTE
If you define an extension to add new functionality to an existing type, the new functionality will be available on all existing instances of that type, even if they were created before the extension was defined.”*/

/*
extension SomeType {
// new functionality to add to SomeType goes here
}
An extension can extend an existing type to make it adopt one or more protocols. Where this is the case, the protocol names are written in exactly the same way as for a class or structure:

extension SomeType: SomeProtocol, AnotherProtocol {
// implementation of protocol requirements goes here
}
*/

//EASY
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
println("One inch is \(oneInch) meters")
// prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
println("Three feet is \(threeFeet) meters")
// prints "Three feet is 0.914399970739201 meters"

let aMarathon = 42.km + 195.m
println("A marathon is \(aMarathon) meters long")
// prints "A marathon is 42195.0 meters long"

/*NOTE
Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties.*/

/*“NOTE
If you use an extension to add an initializer to a value type that provides default values for all of its stored properties and does not define any custom initializers, you can call the default initializer and memberwise initializer for that value type from within your extension’s initializer.
This would not be the case if you had written the initializer as part of the value type’s original implementation, as described in Initializer Delegation for Value Types.*/

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

/*NOTE
If you provide a new initializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.*/


//Methods

extension Int {
    func repetitions(task: () -> ()) {
        for i in 0..self {
            task()
        }
    }
}

3.repetitions({
println("Hello!")
})
// Hello!
// Hello!
// Hello!

3.repetitions {
    println("Goodbye!")
}
// Goodbye!
// Goodbye!
// Goodbye!

extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9


//Subscripts
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
            for _ in 1...digitIndex {
                decimalBase *= 10
            }
            return (self / decimalBase) % 10
    }
}
746381295[0]
// returns 5
746381295[1]
// returns 9
746381295[2]
// returns 2
746381295[8]
// returns 7


746381295[9]
// returns 0, as if you had requested:
0746381295[9]


//Nested Types

extension Character {
    enum Kind {
        case Vowel, Consonant, Other
    }
    var kind: Kind {
    switch String(self).lowercaseString {
    case "a", "e", "i", "o", "u":
        return .Vowel
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        return .Consonant
    default:
        return .Other
        }
    }
}

func printLetterKinds(word: String) {
    println("'\(word)' is made up of the following kinds of letters:")
    for character in word {
        switch character.kind {
        case .Vowel:
            print("vowel ")
        case .Consonant:
            print("consonant ")
        case .Other:
            print("other ")
        }
    }
    print("\n")
}
printLetterKinds("Hello")

// 'Hello' is made up of the following kinds of letters:
// consonant vowel consonant consonant vowel

/*NOTE
character.kind is already known to be of type Character.Kind. Because of this, all of the Character.Kind member values can be written in shorthand form inside the switch statement, such as .Vowel rather than Character.Kind.Vowel.*/







