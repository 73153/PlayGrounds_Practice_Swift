/*NOTE
Swift’s String type is bridged seamlessly to Foundation’s NSString class. If you are working with the Foundation framework in Cocoa or Cocoa Touch, the entire NSString API is available to call on any String value you create, in addition to the String features described in this chapter. You can also use a String value with any API that requires an NSString instance.
For more information about using String with Foundation and Cocoa, see Using Swift with Cocoa and Objective-C.

String literals can include the following special characters:
The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quote) and \' (single quote)
Single-byte Unicode scalars, written as \xnn, where nn is two hexadecimal digits
Two-byte Unicode scalars, written as \unnnn, where nnnn is four hexadecimal digits
Four-byte Unicode scalars, written as \Unnnnnnnn, where nnnnnnnn is eight hexadecimal digits*/


import UIKit

var str = "Strings and Characters"

//let someString = "Some string literal value”

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\x24"        // $,  Unicode scalar U+0024
let blackHeart = "\u2665"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\U0001F496"  // 💖, Unicode scalar U+1F496

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    println("Nothing to see here")
}
// prints "Nothing to see here"


var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

/*NOTE
let constantString = "Highlander"
constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified*/


for character in "Dog!🐶" {
    println(character)
}
// D
// o
// g
// !
// 🐶


let yenSign: Character = "¥"

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")
// prints "unusualMenagerie has 40 characters”

let string1 = "hello"
let string2 = " there"
let character1: Character = "!"
let character2: Character = "?"

let stringPlusCharacter = string1 + character1        // equals "hello!"
let stringPlusString = string1 + string2              // equals "hello there"
let characterPlusString = character1 + string1        // equals "!hello"
let characterPlusCharacter = character1 + character2  // equals "!?”


var instruction = "look over"
instruction += string2
// instruction now equals "look over there"

var welcome = "good morning"
welcome += character1
// welcome now equals "good morning!”

/*NOTE
You can’t append a String or Character to an existing Character variable, because a Character value must contain a single character only.*/


let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5”

/*NOTE
The expressions you write inside parentheses within an interpolated string cannot contain an unescaped double quote (") or backslash (\), and cannot contain a carriage return or line feed.”*/


let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    println("These two strings are considered equal")
}
// prints "These two strings are considered equal”

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}
println("There are \(act1SceneCount) scenes in Act 1")
// prints "There are 5 scenes in Act 1”


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}
println("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// prints "6 mansion scenes; 2 cell scenes”


let normal = "Could you help me, please?"
let shouty = normal.uppercaseString
// shouty is equal to "COULD YOU HELP ME, PLEASE?"
let whispered = normal.lowercaseString
// whispered is equal to "could you help me, please?”


let dogString = "Dog!🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 33 240 159 144 182

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 33 55357 56374


for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ")
}
print("\n")
// 68 111 103 33 128054


for scalar in dogString.unicodeScalars {
    println("\(scalar) ")
}
// D
// o
// g
// !
// 🐶


