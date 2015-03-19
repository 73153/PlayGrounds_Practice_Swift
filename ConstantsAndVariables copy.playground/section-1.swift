// Playground - noun: a place where people can play

import Cocoa

// It's interesting that Apple felt this should be in chapter 2, however this is about 
// constants and variables. Swift provides its own version for all available types inside
// Objective-C. These include Int, Double, Float, Bool, String, Array and Dictionary. In
// addition to this, Swift also offers the use of tuples and other advanced types. Values
// of these types are assigned to constants and variables. The main difference here being
// that a constant cannot be changed (hence "constant"), whereas a variable can. A constant
// is declared using the let keyword, whereas a variable is declared using the var keyword.
// If a value is never going to change during the lifetime of your program, it is good 
// practice to define as a constant rather than a variable (one would assume it's better in
// terms of efficiency, a la Java's final variables).
var variable = 10;
let constant = 15;

// You can declare several variables or constants on a given line, by separating the other
// declarations with a comma. This allows for shorthand variable creation.
var x = 5, y = 10, z = 15;

// Swift automatically attempts to calculate the type being assigned to the variable or
// constant, however in certain cases you may wish to specify your type. Perhaps if you 
// want the value 5 to be a double. This is easily accomplished by specifying the type when
// you create your variable.
var myText: String;

// Variables are then restricted to maintaining their type throughout their lifetime. For 
// example, if you were to define a variable of type Int, and then attempt to turn that 
// variable into a String, you would receive an error. Uncomment the line below to see the 
// error.
var someString = "string";
// someString = 5;

// Likewise, you are unable to create a new variable with the same name as an existing 
// variable. Nor are you able to change a variable into a constant or vice versa. As shown
// above however, you are able to change the value assigned to a variable (assuming you
// keep the same type), but you are unable to change the value of a constant.
var myName = "Ted";
myName = "Steve";

// You are able to print the value of a constant by simply using the println() function. 
// This is as simple as just placing your value in a call to that function. You are also
// able to include constants and variables inside a pre-defined string by using string
// interpolation. This is done using the \(var) syntax.
println(myName);
println("My name is \(myName)");