// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "9:00 pm")
let failure = ServerResponse.Error("out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
    
}

// “Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.”


// Protocols and Extensions

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructre: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}

var b = SimpleStructre()
b.adjust()
let bDescription = b.simpleDescription

// “Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.”



extension Int: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

7.simpleDescription



// “Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.”

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
//protocolValue.anotherProperty   // uncomment to see the error

// “ When you work with values whose type is a protocol type, methods outside the protocol definition are not available.”




