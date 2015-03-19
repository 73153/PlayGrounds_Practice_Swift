// Clojures Playground

import Cocoa

func square(a:Float) -> Float {
    return a * a
}

func cube(a:Float) -> Float {
    return a * a * a
}

func averageSumOfSquares(a:Float,b:Float) -> Float {
    return (square(a) + square(b)) / 2.0
}

func averageSumOfCubes(a:Float,b:Float) -> Float {
    return (cube(a) + cube(b)) / 2.0
}

averageSumOfSquares(3, 4)
averageSumOfCubes(3, 4)

func averageOfFunction(a:Float,b:Float,f:(Float -> Float)) -> Float {
    return (f(a) + f(b)) / 2
}

averageOfFunction(3, 4, square)
averageOfFunction(3, 4, cube)

averageOfFunction(3, 4, {(x: Float) -> Float in return x * x})
averageOfFunction(3, 4, {x in return x * x})

averageOfFunction(3, 4, {x in x * x})
averageOfFunction(3, 4, {$0 * $0})

var moneyArray = [10,20,45,32]

var stringsArray : Array<String> = []
for money in moneyArray {
    stringsArray += "\(money)€"
}

println(stringsArray)

stringsArray = moneyArray.map({ "\($0)€" })
stringsArray = moneyArray.map({money in "\(money)€"})

println(stringsArray)

var filteredArray : Array<Int> = []

for money in moneyArray {
    if (money > 30) {
        filteredArray += money
    }
}

println(filteredArray)

filteredArray = moneyArray.filter({$0 > 30})

println(filteredArray)

var sum = 0
for money in moneyArray {
    sum += money
}

println(sum)

sum = moneyArray.reduce(0,{$0 + $1})

sum = moneyArray.reduce(0,+)

println(sum)
