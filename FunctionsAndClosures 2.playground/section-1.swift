// Playground - noun: a place where people can play

import Cocoa

// The function syntax in Swift is slightly odd (or at least to me, coming from Java). To
// declare a function in Swift, you use the keyword func. As standard, this is followed by 
// a list of arguments in parentheses. To separate the parameter names and types from the
// function's return type, you must use the -> structure. The function below takes two
// String arguments, and returns a String.
func sayHelloTo(first: String, last: String) -> String {
    return "Hello, \(first) \(last)!";
}
sayHelloTo("Tim", "Cook");

// You can use a tuple (sequence of elements) to return multiple values from inside a
// function.
func getPrices() -> (Double, Double, Double) {
    return (15.00, 23.49, 99.99);
}
getPrices();

// Functions are also able to take a variable number of arguments, by taking them into an
// array. This is similar (somewhat) to the way you access 'extra' arguments in other
// languages. As expected, a variable argument list has to be the last parameter in the 
// arguments.
func addAll(numbers: Int...) -> Int {
    var total = 0;
    for number in numbers {
        total += number;
    }
    return total;
}
addAll(1, 2);
addAll(1, 2, 3);
addAll(1, 2, 3, 4);

// Like other scripting languages, functions can be nested inside other functions. These
// functions have access to variables defined in their outer scope, however they are the
// only ones to have access to their inner scope.
func useOuterScope() -> Int {
    var x = 10;
    func add() -> Int {
        return x + 5;
    }
    return add();
}
useOuterScope();

// Functions are a 'first-class' type, meaning that they can also be returned from another
// function. The syntax is a little odd here, because the parentheses contain the arguments
// the returned function takes on the left side of the -> and the return type of the
// returned function is on the right side. If we were to return a function which takes an
// Int argument and returns a String, we would do something like this. You can then just 
// call the returned function via your variable store, or execute without storing.
func makeAgeGetter() -> (Int -> String) {
    func getAge(number: Int) -> String {
        return "My age is \(number)";
    }
    return getAge;
}
var getter = makeAgeGetter();
getter(7);
makeAgeGetter()(7);

// A function can also take another function as an argument, which allows the calling of an 
// external function passed into a function. The functions below use the passing of another
// function to calculate if an array contains any even numbers.
func hasEven(numbers: Int[], isEven: Int -> Bool) -> Bool {
    for number in numbers {
        if isEven(number) {
            return true;
        }
    }
    return false;
}

func calculateEven(number: Int) -> Bool {
    return number % 2 == 0;
}

hasEven([1, 2, 3], calculateEven);
hasEven([1, 3, 5], calculateEven);

// You can overload functions liek you normally would in Swift, by overloading the function
// signature. Here is an example of creating a function to sum numbers together, either by
// passing a list of integers, or by passing a variable number of integer parameters.
func sumOf(numbers: Int[]) -> Int {
    var sum = 0;
    for number in numbers {
        sum += number
    }
    return sum;
}

func sumOf(numbers: Int...) -> Int {
    return sumOf(numbers);
}

// Swift supports anonymous functions, due to the fact that functions are actually just a 
// different form of closure. The syntax here is a little complicated in comparison, but
// it's easy to get the hang of if you take it a step at a time. An anonymous function uses
// the keyword in to separate the arguments from the body. In the case below, the function
// takes an integer argument and return the argument * 3. For those of you unfamiliar, the
// .map() function takes a function to process each integer in the array.
[ 1, 2, 3, 4, 5 ].map({
    (number: Int) -> Int in
    let result = 3 * number;
    return result;
});

// If a closure's (in our context, a function's) type is already known, you can omit the 
// types of the parameters, the return type, or even both. This whittles the above closure
// down to the following closure. This omits both types. Remember that in this case 'in' is
// used to separate the arguments from the body, so don't read it as 'number in 3'.
[ 1, 2, 3, 4, 5 ].map({ number in 3 * number })

// Another useful technique is the ability to specify parameters by number, rather than 
// the actual parameter name. Although this is useful for writing code in shorter form, be 
// aware that this can affect readability in some cases. This feature is only available in
// anonymous functions/closures. Here is an example using the hasEven function from earlier
hasEven([1, 2, 3], { $0 % 2 == 0 });

// I feel that the closure above needs some more information, so I'm going to break it down
// here. If we look at the signature of the hasEven() method, we know that the second 
// argument is a function: isEven: Int -> Bool. This means that we can safely assume that
// this function accepts an Integer, and returns a Boolean. Due to this, we know that the 
// first argument to our closure will be the Integer we want to operate on. So we can use
// this argument via '$0', which just points to the first argument to the function.
// Likewise, we know that this function has to return a boolean, so we can omit the return
// as it's already known that it has to return. Due to this, we can just put in our 
// statement to calculate even, and in essence it resolves to the same calculateEven() 
// function that we had earlier in this file.