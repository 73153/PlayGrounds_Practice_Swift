// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// String and Characters


// “Swift’s String type is bridged seamlessly to Foundation’s NSString class. If you are working with the Foundation framework in Cocoa or Cocoa Touch, the entire NSString API is available to call on any String value you create,”

// String Literals

let someString = "Some string literal value"


// “The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quote) and \' (single quote)”

// “Single-byte Unicode scalars, written as \xnn, where nn is two hexadecimal digits”

// “Two-byte Unicode scalars, written as \unnnn, where nnnn is four hexadecimal digits”

// “Four-byte Unicode scalars, written as \Unnnnnnnn, where nnnnnnnn is eight hexadecimal digits”

let sparklingHeart = "\U0001F496"
let wiseWords = "\"Imagination is more important than knowledge \" - Einstein"

let dollarSign = "\x24"

let blackHeart = "\u2665"


// Initializing an Empty String

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    println("Nothing to see here")
}

// String Mutability

// String Are Value Types

// Working with Characters

for character in "Dog!🐶" {
    println(character)
}


let ys: Character = "🌾"

println(ys)

let unusual = "Koalsdsa"


println("unusual has \(countElements(unusual))")


// “, be aware that the countElements function must iterate over the characters within a string in order to calculate an accurate character count for that string.”

// “Concatenating Strings and Characters”

// String Interpolation

let multiplier = 3

let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// Comparing Strings

//  ==  equal

// “Prefix and Suffix Equality”

// hasPrefix first
// hasSuffix last

// Uppercase and Lowercase Strings

let normal = "Could you help me, please?"

let shouty = normal.uppercaseString

let whispered = normal.lowercaseString


// Unicode

// Unicode Terminology

let dogString = "🐶"

for codeUnit in dogString.utf8 {
    println("\(codeUnit)")
}

// “68 111 103 33 240 159 144 182”

for codeUnit in dogString.utf16 {
    println("\(codeUnit)")
}

// 68 111 103 33 55357 56374

// Unicode Scalars 21-bit

for scalar in  dogString.unicodeScalars {
    println("\(scalar.value)")
    
    // 68 111 103 33 128054
    
    println("\(scalar)")
    
    // D
    // o
    // g
    // !
    // 🐶
}

// “Each UnicodeScalar has a value property that returns the scalar’s 21-bit value, represented within a UInt32 value:”


// “is a decimal equivalent of the hexadecimal value 1F436, which is equivalent to the Unicode scalar U+1F436 for the DOG FACE character.”


// “As an alternative to querying their value properties, each UnicodeScalar value can also be used to construct a new String value, such as with string interpolation”












