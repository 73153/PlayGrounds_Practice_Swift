import Cocoa

var numbers = [3,1,5,2,4,7]

numbers.sort({
    (a: Int, b:Int) -> Bool in
    return a > b
    })

numbers.sort({a, b in return a < b})

numbers.sort({a, b in a > b})

numbers.sort({$0 < $1})

numbers.sort(>)

// Trailing closures
var fruits = ["apple", "grapes", "dataes"]
var lengths = fruits.map {
    countElements($0)
}
lengths


var files = Array(0..43).map({"\($0)@2x.png"})
files


