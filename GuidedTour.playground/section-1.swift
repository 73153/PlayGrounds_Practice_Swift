/* Basics */
import Foundation
var foo = 45
foo = Int(34.398348)

let myCons:Double = 40

let num = 12
let flow = "flow"
let label = "The \(num + 1) Doctors reversed the polarity of the neutron \(flow)."

var names = ["catfish", "dogs"]
names.append("cats")
names
names[2]
names[0]

var jobs = ["Malcolm" : 1, "Barbara": 3]
let emptyDict = Dictionary<String, Float>()
emptyDict.count
jobs.count

/* Conditionals */

let scoreList = [75, 43, 103, 87, 12]
var teamScore = 0
for score in scoreList {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}
teamScore

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
else {
    greeting = "Hello, anonymous!"
}


let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

/* Loops */

let numbers = [
    "Primes": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var previousLarge = 0
for (kind, numb) in numbers {
    for elem in numb {
        if elem > largest {
            previousLarge = largest
            largest = elem
        }
    }
}
previousLarge
largest

var firstLoop = 0
for i in 0...3 {
    firstLoop += i
}
firstLoop

var secondLoop = 0
for var i = 0; i < 3; i++ {
    secondLoop += 1
}
secondLoop

/* Functions */

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
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

// BOOK EXPERIMENT -> Write an average function
func averageOf(numbers: Int...) -> Double {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return Double(sum) / Double(numbers.count)
}

averageOf(42, 43, 78, 46, 55, 58)

// Nested functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()


func mkDoubler() -> (Int -> Int) {
    func doubler(number: Int) -> Int {
        return 2 * number
    }

    return doubler
}

var doubleup = mkDoubler()
doubleup(4)

func hasMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

hasMatches([19, 3, 29984, 2928], lessThanTen)
var numbersList = [20, 19, 7, 12]

numbersList.map({ 3 * $0 })

// BOOK EXPERIMENT -> Return zero for all odd numbers
numbersList.map({ $0 % 2 })

sort([1, 4, 5, 12, 2], { $0 > $1 })
sort([1, 4, 5, 12, 2], { $0 < $1 })

/* Objects and Classes */
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

let s = Shape()
s.simpleDescription()
s.numberOfSides = 2
s.simpleDescription()

class NamedShape {
    var sides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(sides) sides"
    }
}

let nshape = NamedShape(name: "Baz Goof")
nshape.name
nshape.name = "Foo Bar"
nshape.name

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        sides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 64, name: "ASquare")
test.area()
test.simpleDescription()

// BOOK EXPERIMENT -> Write a circle class with a radius property
class Circle: NamedShape {
    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        sides = 0
    }

    func area() -> Double {
        return M_PI * radius * radius
    }

    override func simpleDescription() -> String {
        return "A square named \(name) with radius \(radius)."
    }
}

let aCircle = Circle(radius: 5, name: "AwesomeCircle")
aCircle.area()
aCircle.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        sides = 3
    }

    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "aTriangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    willSet {
        square.sideLength = newValue.sideLength
    }
    }

    var square: Square {
    willSet {
        triangle.sideLength = newValue.sideLength
    }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var tandS = TriangleAndSquare(size: 10, name: "Test Shape")
tandS.square.sideLength
tandS.triangle.sideLength
tandS.square = Square(sideLength: 30, name: "big square")
tandS.triangle.sideLength

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

/** Enumerations **/
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King

    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()
let aceDesc = ace.simpleDescription()

// BOOK EXPERIMENT -> Compare two Rank values by their raw values
func rankComparator(rankA: Rank, rankB: Rank) -> NSComparisonResult {
    if rankA.toRaw() < rankB.toRaw() {
        return NSComparisonResult.OrderedAscending
    }
    else if rankA.toRaw() > rankB.toRaw() {
        return NSComparisonResult.OrderedDescending
    }
    else {
        return NSComparisonResult.OrderedSame
    }
}

rankComparator(Rank.Queen, Rank.King)
rankComparator(Rank.Jack, Rank.Four)
rankComparator(Rank.Ace, Rank.Ace)

if let convertedRank = Rank.fromRaw(3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    // BOOK EXPERIMENT -> Add color method to Suit that returns "black"
    // for spades and clubs, and returns "red" for hearts and diamonds.
    func color() -> String {
        if self == .Hearts || self == .Diamonds {
            return "red"
        }
        else {
            return "black"
        }
    }
}

let hearts = Suit.Hearts
let heartsDesc = hearts.simpleDescription()
Suit.Spades.hashValue
hearts.color()
Suit.Clubs.color()

struct Card {
    var rank: Rank
    var suit: Suit

    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }

    // BOOK Experiment -> Add a method to Card that creates
    // a full deck of cards, with one card of each combo of rank and suit.
    func createDeck() -> Array<String> {
        var deck = Array<String>()
        let suits : Suit[] = [.Hearts, .Diamonds, .Clubs, .Spades]
        for r in 1..14 {
            for s in suits {
                deck.append("\(Rank.fromRaw(r)) of \(suits)")
            }
        }
        return deck
    }
}
let fourOfDiamonds = Card(rank: .Four, suit: .Diamonds)
let fourOfDiamondDescription = fourOfDiamonds.simpleDescription()

let testCard = Card(rank: .Three, suit: .Hearts)
testCard.createDeck()



enum ServerResponse {
    case Result(String, String)
    case ResponseCode(Int) // BOOK EXPERIMENT -> Add a third case
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese")
let code = ServerResponse.ResponseCode(404)

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and " +
    "sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure ... \(error)"
case let .ResponseCode(code):
    let serverResponse = "Response code is \(code)"
}

/** Protocols, Extentions **/
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProp: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A Simple Structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

/** BOOK EXPERIMENT -> Write an enum that conforms to this protocol **/
enum SimpleEnum: Int, ExampleProtocol {
    case A = 0
    case Adjusted
    var simpleDescription: String {
    get {
        return self.describe()
    }
    }

    func describe() -> String {
        switch self {
        case .A:
            return "Got A"
        case .Adjusted:
            return "Got Adjusted"
        default:
            return self.simpleDescription
        }
    }

    mutating func adjust() {
        self = .Adjusted
    }
}
var c = SimpleEnum.A
let temp = c.simpleDescription
c.adjust()
let cDescription = c.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

/**
BOOK EXPERIEMENT -> Write an extension for Double that adds
an absoluteValue property
**/
extension Double {
    var absoluteValue: Double {
    get {
        if self < 0 {
            return -self
        }
        return self
    }
    }
}
let testDouble = -287.038
let someVar = testDouble.absoluteValue

let protValue: ExampleProtocol = a
protValue.simpleDescription


/** Generics **/
func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[] {
    var result = ItemType[]()
    for i in 0..times {
        result += item
    }
    return result
}
repeat("knock", 4)
repeat([1, 2, 3], 4)
repeat(4.0, 29)

enum Maybe<T> {
    case Nothing
    case Just(T)
}

var possibleInteger: Maybe<Int> = .Nothing
possibleInteger = .Just(100)

func anyCommonElements<T, U where T: Sequence, U: Sequence,
    T.GeneratorType.Element: Equatable,
    T.GeneratorType.Element == U.GeneratorType.Element>
    (lhs: T, rhs: U) -> Bool
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([3], [3, 63, 5])

/** BOOK EXPERIMENT -> Modify the anyCommonElements function to make
a function that returns an array of the
elements that any two sequences have in
common.
**/
func myCommonElements<T, U where T: Sequence, U: Sequence,
    T.GeneratorType.Element: Equatable,
    T.GeneratorType.Element == U.GeneratorType.Element>
    (lhs: T, rhs: U) -> Array<T.GeneratorType.Element>
{
    var commonArray = Array<T.GeneratorType.Element>()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonArray.append(lhsItem)
            }
        }
    }
    return commonArray
}

let gatherCommon = myCommonElements([1, 2, 3, 4], [3, 4, 5, 6])
