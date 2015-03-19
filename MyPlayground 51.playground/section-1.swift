// Playground - noun: a place where people can play

import Cocoa

//A Variable declaration
var str = "Hello, playground"

//A Constant declaration
let aConstant = 42
//you can use _ like commas for large numbers
let threemil = 3_000_000

//Implicit and Explicit declaration
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 70.0

//Converting to different types
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
// Remove String = Could not find overload for + that accepts a number

//Include values in strings using backslash(\)
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
let explicitFloat2: Float = 20.04
let myValueSummary = "My new apple share cost me \(explicitFloat2 + explicitFloat2)"
let myName = "Ross"
let myGreeting = "My name is \(myName)"


//Arrays and dictionaries
var shoppingList = ["catfish","water","tulips","blue paint"]
shoppingList[1] = "bottle of water"

var occupations = ["Malcom":"Captain","Kaylee":"Mechanic"]
occupations["Jayne"] = "Public Relations"

//Using count and repeated values for array declaration
var threePis = Double[](count:3,repeatedValue:3.14)
var threeTaus = Double[](count:3,repeatedValue:6.283)

//Combine arrays
threePis + threeTaus

//Empty array and dictionary
let emptyArray = String[]()
let emptyDictionay = Dictionary<String,Float>()

//Went shopping and bought everything
shoppingList = []

//Additional Syntax
var stringArray:String[] = ["hello","there","sir"]
stringArray

stringArray += "how"

stringArray.append("are")
stringArray.append("you")
stringArray
stringArray.insert("it's", atIndex: 0)
stringArray

for word in stringArray{
    println(word)
}

stringArray.removeAtIndex(3)
stringArray

stringArray[1...3]

//remove last item in array
stringArray.removeLast()

//Enumerate over the aray
for(index, value) in enumerate(stringArray){
    println("At \(index + 1) is this \(value)")
}

//Dictionary additional syntax
//var airports:Dictionary<String,String> = ["EWR":"Neward","JFK":"John F Kennedy"]
//Faster way to write the above - as swift knows what you mean
var airports = ["EWR":"Neward","JFK":"John F Kennedy"]
airports.count
airports["PHL"]="Philadelphia"
airports
//You can use a method
airports.updateValue("John F Kennedy Terminal", forKey: "JFK")


//Control Flow 
let individualScores = [75,43,103,87,12]
var teamScore = 0;

for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else  {
        teamScore += 1
    }
}
teamScore

// ? marks as optional
var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
//var optionalName: String? = nil //code in braces is skipped
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

//Switches
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber","watercress":
    let vegetableComment = "That would make a good tea sandwhich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegatableComment = "Everything tastes good in soup"
}
//Switch must contain a default

//for-in
let interestNumbers = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]
var largest = 0
var largesttype: String?
for(kind, numbers) in interestNumbers {
    for number in numbers {
        if number > largest {
            largesttype = kind
            largest = number
        }
    }
}
largest
largesttype


var n = 2
while n < 100 {
    n = n*2
}
n

var m = 2
do {
    m = m*2
} while m < 100
m

//Using ranges in loops
var firstForLoop = 0
for i in 0..3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop
// use .. to omit upper value and ... to include both values

//Functions and closures
func greet(name: String, day:String) -> String{
    return "Hello \(name), today is \(day)"
}

greet("Bob", "Tuesday")


func greeting2(name: String, lunch:String) -> String{
    return "Hello \(name), the special today is \(lunch)"
}

greeting2("Bob", "Lasagne")


//Using tuples to return multiple values
func getGasPrices() -> (Double, Double, Double){
    return(3.59,3.69,3.79)
}
getGasPrices()

//Functions taking variable number of arguments - collected into array - returns tuple added code to work out the average
func sumOfAndAverage(numbers: Int...) -> (Int,Float) {
    var sum = 0
    for number in numbers {
        sum += number
    }
    var countOfInput = numbers.count;
    var average: Float = Float(sum)/Float(countOfInput)
    return (sum, average)
}
sumOfAndAverage()
sumOfAndAverage(42, 597, 12)

//Nested functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y+=5
    }
    add()
    return y
}
returnFifteen()

//Functions are a first class type - function can return function
func makeIncrementer() -> (Int -> Int){
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

//A function can take a function as an argument
func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number:Int)->Bool {
    return number < 10
}

var numbers = [20,19,7,12]
hasAnyMatches(numbers, lessThanTen)

//Functions are a case of closures
//Surround with {} use in to seperate the arguments and return type from body

numbers.map({(number:Int)-> Int in
            let result = 3 * number
            return result
            })

//Experiment - rewrite the colusre to return zero for all oddNumbers

numbers.map({(number:Int)-> Int in
    var result = 0
    var remainder = number % 2
    
    if remainder == 0 {
        result = 3 * number
    }
    return result

    })

//When the closures type is known
numbers.map({number in 3 * number })

sort([1,5,3,12,2]) { $0 > $1 }

//More function syntax - (Skip Wilson tutorial)
func sumAndCieling(a:Int , b:Int) -> (Int,Int){
    var ceiling = a > b ? a:b
    var sum =  a + b
    return (sum,ceiling)
}

var total = sumAndCieling(14,52)
total.0
total.1

//More on closures - skip wilson
//Functions - are named closures
func sayHello(){
    println("Hello from the function")
}
sayHello()

//declaring a variable called sayHelloClosure
//the type of the variable is function that takes no args and returns no value
var sayHelloClosure: () -> () = {
    println("Hello from the closure")
}
sayHelloClosure = sayHello
sayHelloClosure()

func introduceToFriends(friendOne: String, friendTwo: String) -> String {
    return "\(friendOne) I'd like you to meet mey other friend \(friendTwo)"
}

var intro = introduceToFriends("Jim", "Pam")
intro

//{
//    ()-> returntype in
//    statements
//}

//Declared to be a closure - takes two strings and returns string
var combine: (String, String) -> String


//combine = {
//    a,b -> String in
//    return a + b
//}

//combine = {
//    a,b -> String in a + b
//}

//An abstract version - swift automaticall provides type inferred short hand arguments
//combine = { $0 + $1 }
//
//combine("Hello ","world")

//Using the short hand $ syntax can be confusing
let hasPrefixAndSuffix: (String,String,String) -> Bool = {
    var hasPrefix =  $0.hasPrefix($1)
    var hasSuffix =  $0.hasSuffix($2)
    return hasPrefix && hasSuffix
    
}

hasPrefixAndSuffix("Jim - Bob", "Jim","Bob")

let aBunchOfInts = [1,2,3,4,5,6,7,8,9,10]

//(int,int) -> Bool
func reverseSorterFunc(numberOne: Int, numberTwo: Int) -> Bool {
    if numberOne < numberTwo {
        return false
    }
    return true
    
}
sort(aBunchOfInts,reverseSorterFunc)

//re written as a closure
let forwardSortClosure: (Int, Int) -> Bool = {
    (numberOne:Int, numberTwo:Int) -> Bool in
    if numberOne < numberTwo {
        return true
    }
    return false
}

sort(aBunchOfInts,forwardSortClosure)

//Super short hand version
println(sort(aBunchOfInts, {$0 > $1}))

//Or to be ridicolous as > and < is actually a function
println(sort(aBunchOfInts, > ))

let digitNames = [0:"Zero", 1:"One", 2: "Two", 3: "Three" , 4: "Four", 5: "Five", 6: "Six",
    7: "Seven", 8: "Eight", 9: "Nine"]
let arrayOfInts = [1,2,3,4,5,6,7,8,9]

digitNames[10] //is an optional as it may not return


let stringArrayFunc = arrayOfInts.map {
    (number:Int) -> String in
    var returnString:String = digitNames[number]!
    let length = countElements(returnString)
    
    if length < digitNames.count{
        //put exclamation point - get raw value if you are 100% you will find what you want - maybe nil
        returnString = digitNames[length]!
    }
    
    return returnString
}

stringArrayFunc

//Avoiding memory leaks (when objects strong reference each other
//@lazy is lazy loading - built in to the language
//@lazy attribute - property isnt loaded until you access it
//self will be initialized before you use it
//using capture lists [unowned self] you declare self as unowned as its safe to assume it wont be nil
//use [weak self] if it may become nil - unowned will not be assigned an optional but weak will


//Giving the tuple returns - names making them easier to address
func sumAndFloor(a:Int , b:Int) -> (sum:Int,floor:Int){
    var floor = a < b ? a:b
    var sum =  a + b
    return (sum,floor)
}

var totalFloor = sumAndFloor(13, 4)
totalFloor.sum
totalFloor.floor

func double(number:Int) -> Int {
    return number * 2
}
//func takes in integer and returns integer
// describe using Int -> Int
func triple(number:Int) -> Int {
    return number * 3
}

//Using the # to specify you must pass in a variable of the same name
//modifier is another function
func modifyInt(#number:Int, #modifier:Int -> Int) -> Int{
    return modifier(number)
}

modifyInt(number: 15, modifier: double)
modifyInt(number: 16, modifier: triple)

//buildIncrementor returns a function that takes zero params and returns type int
//return a function from a function
func buildIncrementor() -> () -> Int {
    var count = 0
    func incrementor() -> Int {
        ++count
        return count
    }
    return incrementor
}

var incrementor = buildIncrementor()
incrementor()
incrementor()

func average(#numbers:Int...) -> Int {
    var total = 0
    for n in numbers {
        total += n
    }
    return total / numbers.count
}
average(numbers: 13,14,235,52,5)

func joinString(#strings: String[]) -> String {
    var returnStr = ""
    for str in strings {
        returnStr += str
    }
    return returnStr
}

func joinString(#strings: String...) -> String {
    return joinString(strings: strings)
}

var arrayOfStrings = ["I","am","an","array"]
joinString(strings: arrayOfStrings)
joinString(strings: "I","am","variadic")

//Ability to define default parameters
//inout means take variable outside scope and modify inside scope
//Declaring increment as defaulted as 1
func incrementNumber(inout #number: Int, increment:Int = 1){
    number += increment
}

//Using default increment and modify it
var ourInt = 1
incrementNumber(number: &ourInt)
ourInt
incrementNumber(number: &ourInt)
ourInt
incrementNumber(number: &ourInt, increment:2)
ourInt

//Objects and Classes
class NamedShape {
    var numberOfSides = 0
    var name: String
    let constantProperty = 5
    
    init(name:String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
//    func setShapeName(name:String){
//        //Nothing happens here yet
//    }
}


var shape = NamedShape(name: "Septagon")
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name:String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//Experiment - subclass of NamedShape called circle

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name:String){
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        //pi(r^2)
        return pi * (pow(radius, 2))
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)"
    }
}

let testCircle = Circle(radius: 5.2, name: "my test circle")
testCircle.area()
testCircle.simpleDescription()


//Using getters and setters
class EquilateralTriangle: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name:String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 3
    }
    
    var perimeter:Double{
    get{
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }}
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength


//Use willset and didset to run code that is run before and after setting a new value.
class TriangleAndSquare {
    
    var triangle:EquilateralTriangle{
    willSet{
        square.sideLength = newValue.sideLength
    }
    }
    var square: Square {
    willSet{
        triangle.sideLength = newValue.sideLength
    }
    }
    init(size:Double, name:String){
        square = Square(sideLength: size , name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
    
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name:"larger square")
triangleAndSquare.triangle.sideLength

//methods on classes are different from functions - method has the same name for its paremeters when you call it and within the method itself - you can specify a second name
class Counter {
    var count: Int = 0;
    //example here called number of times in call
    func incrementBy(amount: Int, numberOfTimes times:Int){
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

//Using optional values
let optionalSquare: Square? = Square(sideLength: 2.5, name:"optional square")
let sideLength = optionalSquare?.sideLength

//Structs values- copied and passed around
//both define properties
//both define methods
//both define subscripts
//both define initializers
//and both can be extended
//both confirm to protocols

//Classes add inheritence
//Classes can be type cast
//Classes can be de-init
//Classes can be de referenced

//Defintiion of a struct
struct someStruct {
    
}

struct GeoPoint {
    var latitude = 0.0
    var longitude = 0.0
}

//create instance of Geopoint
var newGeoPoint = GeoPoint()
newGeoPoint.latitude = 42.8572
newGeoPoint.longitude = -12.4222

//can also do this at initialization
var memberwiseGeoPoint = GeoPoint(latitude: 12.324, longitude: 29.1111)

struct Point {
    var x:Int, y:Int
}

struct Size {
    var width:Int, height:Int
}

struct Rect {
    var origin:Point, size:Size
    
    func center() -> Point{
        var x = origin.x + (size.width / 2)
        var y = origin.y + (size.height / 2)
        return Point(x:x,y:y)
    }
}
//Should use optionals for nil
//var newRect = Rect() -- wont work

var origin = Point(x: 0,y: 0)
var size = Size(width: 100, height: 100)
var rect = Rect(origin: origin, size: size)

rect.size.width = 80
rect

var center = rect.center()

//Create a new point
var pointOne = Point(x: 10, y: 10)
//is a new instance of pointOne as copy is made
var pointTwo = pointOne

//Demo to show the copy is made
pointTwo.x = 20
pointOne.x
pointTwo.x

struct Foo {
    var someProperty = 0.0
    mutating func increment(increment:Double = 1){
        //throws error- because function hasnt been given permission to modify the property
        //use mutating to fix
        self.someProperty += increment
    }
}

var myFoo = Foo()
myFoo.increment()
myFoo.someProperty
myFoo.increment(increment: 2)
myFoo.someProperty


//Multiple variables on one line
var one = 1, two = 2, three = 3
one
two
three

//Enums - skip wilson tutorial 
enum Someenum {
    //enum goes here
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

var directionToHead:CompassPoint
directionToHead = .West


//Should read as self evident
enum Matter {
    case Solid, Liquid, Gas
}

var currentMatter = Matter.Liquid

switch currentMatter {
case .Solid:
    println("It was solid")
case .Liquid:
    println("It was liquid")
case .Gas:
    println("It was gas")
}

enum Computer {
    //RAM, Processor
    case Desktop(Int, String)
    
    //Screensize
    case Laptop(Int)
    
    //weight, height and width
    case Phone(Int,Int,Int)
    
    //width, height
    case Tablet
}

var computer = Computer.Desktop(8, "i7")

switch computer {
case .Desktop(let ram, let processor):
    println("Was desktop with \(ram)gb of Ram and a \(processor)processor")
default:
    println("No idea")
}

//Raw values must be unique in the enum
//the raw value is after Planet
enum Planet:Int {
    //Raw value is auto incremented
    case Mercury = 1, Venus, Earth, Jupiter, Saturn, Uranus, Neptune
}
//Is 3 (as value has been auto incremented
Planet.Earth.toRaw()

Planet.fromRaw(4) == Planet.Jupiter // Yes

//Can use optional pindings
if let possiblePlanet = Planet.fromRaw(5){
    switch possiblePlanet {
    case .Jupiter:
        println("was jupiter")
    default:
        println("I don't know ")
    }
}else {
    println("No Planet found here")
}

//Subscripts - 
//Square brackets is sbscripts internally
var someArray = [1,2,3]
someArray[2]

struct TimeTable {
    let multiplier:Int
    //subscript
    subscript(index:Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimeTable(multiplier: 3)
threeTimesTable[3]
//Shortcut for accessing lists, dictionaries etc

func randomizer(#range:Range<UInt32>) -> UInt32 {
    return range.startIndex + arc4random_uniform(range.endIndex-range.startIndex + 1)
}

struct LevelMaker {
    var grid = Array<Array<UInt32>>()
    
    //changing structure so have to use mutating
    mutating func makeGrid(){
        var numColumns = 27
        var numRows = 52
        for column in 0..numColumns {
            var newRow = Array<UInt32>()
            for row in 0..numRows {
                newRow.append(randomizer(range:1..32))
            }
            self.grid.append(newRow)
        }
    }
    subscript(row:Int, column:Int) -> UInt32 {
        return grid[row][column]
    }
    init(){
        makeGrid()
    }
}

var level2 = LevelMaker()
level2.grid
level2.grid[2][5]

















