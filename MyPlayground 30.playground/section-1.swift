// Playground - noun: a place where people can play

// A Swift Tour
import Cocoa

// Simple Values
var str = "Hello, playground"

let implicitInterger = 70
let explicitDouble:Double = 70


let label = "The width is "
let width =  94
let widthLabel = label + String(width)

var shoppingList = ["catfish","adasd","hahah"]

shoppingList[0]

var occupations = [
    "ddd":"aaa",
    "kaylee" : "mecahic"

]

occupations["ddd"] = "Publlis"


let emptyArray = String[]()
let emptyDictionary = Dictionary<String,Float>()



//Control Flow

let individualScores = [74,55,32,103,23]

var teamScore = 0

for score in individualScores{
    if score > 50{
        teamScore += 3
    }
    else
    {
        teamScore += 1
    }
}
teamScore




var optionalString:String? = "Hello"
optionalString == nil

var optionalName : String? = "John"
var greeting = "Hello!"
optionalName = nil

if let name = optionalName{
    greeting = "Hello,\(name)"
}
else
{
    greeting = "aaa"
}


let vegetable = "red"

switch vegetable
{
    case "cele":
     let veds = "aasdc"
    case "sdasd","aaaa":
    let veds = "bbb"
case let x where x.hasSuffix("red"):
    let veds = "sss"
default:
    let veds = "eve"
}


let interest = [
    "Prime" : [2,3,5,7,11,13],
    "Fib" : [1,1,2,3,5,8],
    "Square" : [1,4,9,16,25]
]
var largest = 0
for (kind,numbers) in interest
{
    for number in numbers{
        if number > largest{
            largest = number
        }
    }
}

largest

var n = 2
while n < 100
{
    n = n*2
}
n

var m = 2
do {
m = m*2
} while m < 100

m
var firstForLoop = 0

for i in 0..3
{
    firstForLoop += i
}
firstForLoop

// “Use .. to make a range that omits its upper value, and use ... to make a range that includes both values.”

//Functions and Closures

func greet(name:String ,day : String) ->String
{
    return "Hello\(name),today is \(day)"
}

greet("Bob", "Tuesday")

func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()


func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)



// “A function can take another function as one of its arguments.”

func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(numbers, lessThanTen)

// closures
// 





