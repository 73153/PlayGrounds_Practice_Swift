// Playground - noun: a place where people can play

import Cocoa

// All the typical flows are available in Swift, arguably with more flexibility than other
// languages. Below is a typical if statement block. According to the Apple documentation,
// braces around the condition are optional, however braces around the body are required.
var number = 5;
var outcome = "Condition Failed!";

if number > 2 {
    outcome = "Condition Passed!";
}

// Swift also has support for using the keyword let to work alongside conditions in an if
// statement. This is done using optional variable. An optional variable is a variable
// which can either be nil or have a value. This is dicatated by a question mark (?) symbol
var optionalName: String? = "Swift Developer";

// This can be used in conjunction with if statements to only continue into the block if
// the value is not nil. Below is an example using the above optional variable. The use
// of let continues the code into the block only if the optional value is not nil. In this
// case, we use the constant "name" in order to access optionalName inside our code block.
var greeting = "Hello!";

if let name = optionalName {
    greeting = "Hello, \(name)";
}

// Switches are extremely powerful in Swift, with the ability to extend beyond working with
// integers, and being more flexible than just testing equality. There is also the added 
// bonus of being able to specify a case with multiple satisfying conditions, which allows
// the use of the same case block in two cases, without having to be cautious of break 
// placement. As such, break is not required in Swift to stop execution after a case. You
// can also use let in a similar way to if conditions, to allow the use of conditions in 
// a case. Interestingly, XCode reports an issue if a default case is left out, due to the
// need to be "exhaustive".
let vegetable = "red pepper";

switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log.";
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich.";
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?";
default:
    let vegetableComment = "Everything tastes good in soup.";
}

// You can use a for-in loop to iterate over items in a dictionary by providing names to
// use for each key-value in the dictionary. The loops below simple store the largest odd
// and even number from the numberSet inside the "largest" variable.
var numberSet = [
    "odd": [ 1, 3, 5, 7, 9 ],
    "even": [ 2, 4, 6, 8, 10 ]
];

var largest = [
    "odd":0,
    "even":0,
];

for (type, numbers) in numberSet {
    for number in numbers {
        if number > largest[type] {
            largest[type] = number;
        }
    }
}
largest

// Swift also supports while loops, and the do ... while structure. The main difference 
// between these two structures is that the do ... while loop runs at least once, whereas
// there is a possibility that the typical while loop might not run at all. However, these
// two loops can be used to do the exact same thing, if considered properly beforehand.
var n = 2;
while n < 100 {
    n = n * 2;
}
n

var m = 2;
do {
    m = m * 2;
} while m < 100;
m

// Swift allows the use of either ../... to make a range of indexes, or by using a set 
// expression. The use of a set expression is one that most developers will be familiar
// with already.
var factorThree = 0;
for var i = 1; i < 100; i += 3 {
    factorThree++;
}
factorThree

// The ../... method is also pretty easy to master, however it might be a bit unusual to 
// begin with. Use .. to create a range that omits it's upper value (<) and use ... to use
// a range which includes it's upper value (<=)
factorThree = 0;
for i in 1 .. 100 {
    factorThree++;
}
factorThree / 3
