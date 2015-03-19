// Playground - noun: a place where people can play

import Cocoa

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1:String, s2:String) -> Bool
{
    return s1 > s2
}

var reversed = sort(names, backwards)
println(reversed)

reversed = sort(names, {(s1:String, s2:String)->Bool in return s1 < s2})
println(reversed)

reversed = sort(names, {s1, s2 in return s1 > s2})
println(reversed)

reversed = sort(names, {s1, s2 in s1 < s2})
println(reversed)

reversed = sort(names, {$0 > $1})
println(reversed)

reversed = sort(names, <)
println(reversed)

reversed = sort(names) { $0 > $1 }
println(reversed)

let digitNames = [
    0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four",
    5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"
]

let numbers = [16,58,510]

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number%10]! + output
        number /= 10
    }
    return output
}

println(strings)

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

let incrementByTwo = makeIncrementor(forIncrement: 2)

incrementByTwo()
incrementByTwo()
incrementByTwo()

incrementByTen()

let alsoIncrementByTen = incrementByTen

alsoIncrementByTen()






