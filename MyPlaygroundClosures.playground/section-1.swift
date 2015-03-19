// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// Closures

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversed = sort(names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})



reversed = sort(names, { s1, s2 in return s1 < s2 } )

reversed



reversed = sort(names, { $0 > $1 } )

reversed = sort(names, >)



// Trailing Closures


func someFunctionThatTakesAClosure(closure: () -> () ) {
    // function body goes here
}

someFunctionThatTakesAClosure({
    // closure's body goes here
    })


someFunctionThatTakesAClosure() {
    
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map{
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

// “strings is inferred to be of type String[]”
// “its value is ["OneSix", "FiveEight", "FiveOneZero"]”


// “The call to the digitNames dictionary’s subscript is followed by an exclamation mark (!), because dictionary subscripts return an optional value to indicate that the dictionary lookup can fail if the key does not exist.”

// Capturing Values

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)

incrementByTen()

incrementByTen()

incrementByTen()

// “If you create another incrementor, it will have its own stored reference to a new, separate runningTotal variable”

// unconnected

let incrementBySeven = makeIncrementor(forIncrement: 7)

incrementBySeven()

incrementByTen()





// “The incrementor function doesn’t have any parameters, and yet it refers to runningTotal and amount from within its function body. It does this by capturing the existing values of runningTotal and amount from its surrounding function and using them within its own function body.”

// “Capturing a reference ensures sure that runningTotal does not disappear when the call to makeIncrementor ends, and ensures that runningTotal will continue to be available the next time that the incrementor function is called.”


// “This is because functions and closures are reference types.


// “ it is the choice of closure that incrementByTen refers to that is constant, and not the contents of the closure itself.”

// “This also means that if you assign a closure to two different constants or variables, both of those constants or variables will refer to the same closure:”

let alsoIncrementByTen = incrementByTen

alsoIncrementByTen()





