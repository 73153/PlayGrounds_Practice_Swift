// Playground - noun: a place where people can play

import UIKit

var str = "Inheritance"

/*NOTE
Swift classes do not inherit from a universal base class. Classes you define without specifying a superclass automatically become base classes for you to build upon.*/

//EASY
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}

let someVehicle = Vehicle()


//Subclassing

class Bicycle: Vehicle {
    init() {
        super.init()
        numberOfWheels = 2
    }
}

/*NOTE
Unlike Objective-C, initializers are not inherited by default in Swift. For more information, see Initializer Inheritance and Overriding.*/

let someBicycle = Bicycle()
println("Bicycle: \(someBicycle.description())")
// Bicycle: 2 wheels; up to 1 passengers

class Tandem: Bicycle {
    init() {
        super.init()
        maxPassengers = 2
    }
}

let someTandem = Tandem ()
println("Tandem: \(someTandem.description())")


/*NOTE
Subclasses are only allowed to modify variable properties of superclasses during initialization. You can’t modify inherited constant properties of subclasses.*/


//Override

/*NOTE
Where this is appropriate, you access the superclass version of a method, property, or subscript by using the super prefix:

An overridden method named someMethod can call the superclass version of someMethod by calling super.someMethod() within the overriding method implementation.
An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.
An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.*/

//EASY
class Car: Vehicle
{
    var speed: Double = 0.0
    init()
    {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description() -> String
    {
        return super.description() + "; " + "traveling at \(speed) mph"
    }
}
let someCar = Car()
println("Car: \(someCar.description())")
// Car: 4 wheels; up to 5 passengers; traveling at 0.0 mph


//Overriding Properties

/*NOTE
If you provide a setter as part of a property override, you must also provide a getter for that override. If you don’t want to modify the inherited property’s value within the overriding getter, you can simply pass through the inherited value by returning super.someProperty from the getter, as in the SpeedLimitedCar example below.*/

//EASY
class SpeedLimitedCar: Car {
    override var speed: Double  {
    get {
        return super.speed
    }
    set {
        super.speed = min(newValue, 40.0)
    }
    }
}

let limitedCar = SpeedLimitedCar()
limitedCar.speed = 60.0
println("SpeedLimitedCar: \(limitedCar.description())")
// SpeedLimitedCar: 4 wheels; up to 5 passengers; traveling at 40.0 mph


//Overriding Property Observers
/*NOTE
You cannot add property observers to inherited constant stored properties or inherited read-only computed properties. The value of these properties cannot be set, and so it is not appropriate to provide a willSet or didSet implementation as part of an override.
Note also that you cannot provide both an overriding setter and an overriding property observer. If you want to observe changes to a property’s value, and you are already providing a custom setter for that property, you can simply observe any value changes from within the custom setter.*/

class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
    didSet {
        gear = Int(speed / 10.0) + 1
    }
    }
    override func description() -> String {
        return super.description() + " in gear \(gear)"
    }
}

let someAutomaticCar = AutomaticCar()
someAutomaticCar.speed = 35.0
println("AutomaticCar: \(someAutomaticCar.description())")
// AutomaticCar: 4 wheels; up to 5 passengers; traveling at 35.0 mph in gear 4

/*NOTE
Preventing Overrides
You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the @final attribute before its introducer keyword (such as @final var, @final func, @final class func, and @final subscript).

Any attempts to override a final method, property, or subscript in a subclass are reported as a compile-time error. Methods, properties or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition.

You can mark an entire class as final by writing the @final attribute before the class keyword in its class definition (@final class). Any attempts to subclass a final class will be reported as a compile-time error.*/











