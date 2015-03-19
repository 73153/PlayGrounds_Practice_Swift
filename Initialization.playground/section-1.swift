// Playground - noun: a place where people can play

import UIKit

var str = "Initialization"

/*NOTE

When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.*/

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
println("The default temperature is \(f.temperature)° Fahrenheit")
// prints "The default temperature is 32.0° Fahrenheit”

/*NOTE
If a property always takes the same initial value, provide a default value rather than setting a value within an initializer. The end result is the same, but the default value ties the property’s initialization more closely to its declaration. It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value. The default value also makes it easier for you to take advantage of default initializers and initializer inheritance, as described later in this chapter.*/

struct Fahrenheit2 {
    var temperature = 32.0
}

struct Celsius {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

/*NOTE
If you do not want to provide an external name for a parameter in an initializer, provide an underscore (_) as an explicit external name for that parameter to override the default behavior described above.*/

struct Color {
    let red = 0.0, green = 0.0, blue = 0.0
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

/*
let veryGreen = Color(0.0, 1.0, 0.0)
// this reports a compile-time error - external names are required
*/


//Optional Property Types

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// prints "Do you like cheese?"

cheeseQuestion.response = "Yes, I do like cheese."


//Modifying Constant Properties During Initialization

/*NOTE
For class instances, a constant property can only be modified during initialization by the class that introduces it. It cannot be modified by a subclass.*/

class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
// prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"


//Default Initializers

class ShoppingListItem2 {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem2()


//Memberwise Initializers for Structure Types

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

/*NOTE
If you want your custom value type to be initializable with the default initializer and memberwise initializer, and also with your own custom initializers, write your custom initializers in an extension rather than as part of the value type’s original implementation. For more information, see Extensions.*/

//EASY
struct Size2 {
    var width = 0.0, height = 0.0
}
struct Point2 {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point2()
    var size = Size2()
    init() {}
    init(origin: Point2, size: Size2) {
        self.origin = origin
        self.size = size
    }
    init(center: Point2, size: Size2) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point2(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

let originRect = Rect(origin: Point2(x: 2.0, y: 2.0),
    size: Size2(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

let centerRect = Rect(center: Point2(x: 4.0, y: 4.0),
    size: Size2(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

/*NOTE
For an alternative way to write this example without defining the init() and init(origin:size:) initializers yourself, see Extensions.*/

//Designated Initializers

/*NOTE
Designated Initializers
Rule 1
Designated initializers must call a designated initializer from their immediate superclass.

Rule 2
Convenience initializers must call another initializer available in the same class.

Rule 3
Convenience initializers must ultimately end up calling a designated initializer.

A simple way to remember this is:
    Designated initializers must always delegate up.
    Convenience initializers must always delegate across.*/

/*NOTE
These rules don’t affect how users of your classes create instances of each class. Any initializer in the diagram above can be used to create a fully-initialized instance of the class they belong to. The rules only affect how you write the class’s implementation.*/


//Two-Phase Initialization
/*NOTE
Swift’s two-phase initialization process is similar to initialization in Objective-C. The main difference is that during phase 1, Objective-C assigns zero or null values (such as 0 or nil) to every property. Swift’s initialization flow is more flexible in that it lets you set custom initial values, and can cope with types for which 0 or nil is not a valid default value.*/

/*NOTE
Unlike methods, properties, and subscripts, you do not need to write the override keyword when overriding an initializer.*/

//EASY
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"
let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
    var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

/*NOTE
ShoppingListItem does not define an initializer to provide an initial value for purchased, because items in a shopping list (as modeled here) always start out unpurchased.*/


var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    println(item.description)
}
// 1 x orange juice ✔
// 1 x bacon ✘
// 6 x eggs ✘


//Setting a Default Property Value with a Closure or Function
/*
class SomeClass {
    let someProperty: SomeType = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return someValue
        }()
}
*/

/*NOTE
If you use a closure to initialize a property, remember that the rest of the instance has not yet been initialized at the point that the closure is executed. This means that you cannot access any other property values from within your closure, even if those properties have default values. You also cannot use the implicit self property, or call any of the instance’s methods.*/

struct Checkerboard {
    let boardColors: Bool[] = {
        var temporaryBoard = Bool[]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
        }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
// prints "true"
println(board.squareIsBlackAtRow(9, column: 9))
// prints "false"












