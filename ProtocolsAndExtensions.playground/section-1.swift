// Playground - noun: a place where people can play

import Cocoa

// A protocol can be adopted by classes, enumerations and structs. They're defined as 
// simply as providing the protocol keyword. Protocols are types that a class must adhere
// to when created.
protocol myProtocol {
    var value: Int { get }
    mutating func add(Int);
}

// As mentioned, classes, enumerations and structs can implement a protocol. It's important
// to note that a struct must use the mutating keyword alongside any methods which may 
// modify the structure. This keyword is not required in a class, as methods inside a class
// may always modify a class.
class myClass: myProtocol {
    var value: Int = 10;
    
    func add(number: Int) {
        value += number;
    }
}

var c = myClass();
c.add(5);
c.value;

// struct
struct myStruct: myProtocol {
    var value: Int = 15;
    
    mutating func add(number: Int) {
        value += number;
    }
}

var s = myStruct();
s.add(15);
s.value;

// You can use the extension keyword to add functionality to an existing protocol, such as
// new methods and properties. You can use extensions to add protocol conformance to a type
// that is declared elsewhere in your program. Below is an example of adding an extension
// to the first-class type Int.
extension Int: myProtocol {
    var value: Int {
        return self;
    }
    var description: String {
        return "I am the number \(self)"
    }
    mutating func add(number: Int) {
        self += number;
    }
}

7.description;

// You can use a protocol name just like all other named types, with an example being the
// the ability to create a collection of objects of different types, but that all conform
// to the same protocol. However, when working with a value whose type is a protocol type,
// methods and properties outside of the protocol definition are not accessible. Even
// though technically the variables below have a runtime type of myClass and myStruct, 
// the compiler treats them as the given type of myProtocol. This means that when the code
// is compiled, you can't accidentally access methods or properties that are implemented in
// the class but outside the scope of the protocol conformance.
let protocolClass: myProtocol = c;
let protocolStruct: myProtocol = s;


