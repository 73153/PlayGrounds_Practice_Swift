// Playground - noun: a place where people can play

import Cocoa;

// The keyword let allows the creation of a variable which cannot be changed. This is
// a constant value throughout execution - similar to the final type in Java.
let someConstant = "unchanging";

// Assuming you then try to change the above value to something else, you will receive
// an error. As an example, the line below should display an error when uncommented.
// someConstant = "changed";

// In Swift, values are declared as loosely type, however they are then strongly typed
// by inferring the type. These types are then strict for the remainder of execution.
var someInt = 5;

// Which means that trying to convert a value to another type should again display an
// error.
// someInt = "5";

// Swift does provide the ability to specify the type of the variable on declaration.
// Consider trying to declare a Float or a Double type, when your initial value is simply
// 1. To do this, you can specify the type using the colon character after the variable
// name.
var someFloat: Float = 4;

// Due to the fact that values are not converted to another type automatically, this
// means that typical String concatenation is somewhat different to what you might expect.
//
// You might expect something like this to work correctly:
// var someJoinedString = someConstant + " " + someFloat;

// To achieve the above, you need to do a String converstion to join your values
var someJoinedString = someConstant + " " + String(someFloat);

// You can also achieve the above by resolving the variable inside the \(var) syntax which
// is available in Swift. Simple wrap your variable in this way to include it *inside* a
// string.
someJoinedString = someConstant + " \(someFloat)";

// Creating arrays is pretty simple in Swift, in fact it's pretty much identical to the way
// that JavaScript declares arrays. Simply do the following.
var someList = [ "a", "list", "of", "strings" ];

// Accessing is the usual
someList[1];

// Object/Dictionary/Hash creation is again pretty simple
var someObject = [
    "key":"value"
];

// And again, accessing a given key is fairly simple to do
someObject["key"];

// Editing is as simple as just setting the element/key to your new value
someList[1] = "group";
someObject["key"] = "test";

// It's very easy to create arrays/dictionaries, and there are both different ways when the 
// type can/can not be inferred. Below is an example of specifying the type of values being 
// stored in the array/dictionary.
var emptyArray = String[]();
var emptyDict = Dictionary<String, Float>();

// If the type can be inferred, you can use a more traditional method to create these types
var emptyArrayTraditional = [];
var emptyObjectTraditional = [:];

// Although it's entirely up to preference, you can also comma separate variables on their
// declaration, without having to stick to the same typing.
var number = 5, string = "string";
