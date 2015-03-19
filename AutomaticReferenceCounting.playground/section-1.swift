/*NOTE

Reference counting only applies to instances of classes. Structures and enumerations are value types, not reference types, and are not stored and passed by reference.*/

import UIKit

var str = "Automatic Reference Counting"

class Person2 {
    let name: String
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

var reference1: Person2?
var reference2: Person2?
var reference3: Person2?

reference1 = Person2(name: "John Appleseed")
// prints "John Appleseed is being initialized"

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil
// prints "John Appleseed is being deinitialized"



//EASY
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { println("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    var tenant: Person?
    deinit { println("Apartment #\(number) is being deinitialized") }
}

var john: Person?
var number73: Apartment?

john = Person(name: "John Appleseed")
number73 = Apartment(number: 73)

john!.apartment = number73
number73!.tenant = john

//john = nil
//number73 = nil

/*NOTE
Weak references must be declared as variables, to indicate that their value can change at runtime. A weak reference cannot be declared as a constant.*/


class PersonWeak {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentWeak?
    deinit { println("\(name) is being deinitialized") }
}

class ApartmentWeak {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: PersonWeak?
    deinit { println("Apartment #\(number) is being deinitialized") }
}

var johnWeak: PersonWeak?
var number73Weak: ApartmentWeak?

johnWeak = PersonWeak(name: "John Appleseed")
number73Weak = ApartmentWeak(number: 73)

johnWeak!.apartment = number73Weak
number73Weak!.tenant = johnWeak

johnWeak = nil
// prints "John Appleseed is being deinitialized"

number73Weak = nil
// prints "Apartment #73 is being deinitialized"



//Unowned References

/*“NOTE
If you try to access an unowned reference after the instance that it references is deallocated, you will trigger a runtime error. Use unowned references only when you are sure that the reference will always refer to an instance.
Note also that Swift guarantees your app will crash if you try to access an unowned reference after the instance it references is deallocated. You will never encounter unexpected behavior in this situation. Your app will always crash reliably, although you should, of course, prevent it from doing so.*/


//EASY
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { println("\(name) is being deinitialized") }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { println("Card #\(number) is being deinitialized") }
}

var johnCustomer: Customer?

johnCustomer = Customer(name: "John Appleseed")
johnCustomer!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnCustomer!)

johnCustomer = nil
// prints "John Appleseed is being deinitialized"
// prints "Card #1234567890123456 is being deinitialized"


//Unowned References and Implicitly Unwrapped Optional Properties

//EASY
class Country {
    let name: String
    let capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
println("\(country.name)'s capital city is called \(country.capitalCity.name)")
// prints "Canada's capital city is called Ottawa"


//Strong Reference Cycles for Closures

class HTMLElement {
    
    let name: String
    let text: String?
    
    @lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
    
}


/*NOTE
The asHTML property is declared as a lazy property, because it is only needed if and when the element actually needs to be rendered as a string value for some HTML output target. The fact that asHTML is a lazy property means that you can refer to self within the default closure, because the lazy property will not be accessed until after initialization has been completed and self is known to exist.*/



var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
println(paragraph!.asHTML())
// prints "<p>hello, world</p>"

/*NOTE
The paragraph variable above is defined as an optional HTMLElement, so that it can be set to nil below to demonstrate the presence of a strong reference cycle.*/

/*NOTE
Even though the closure refers to self multiple times, it only captures one strong reference to the HTMLElement instance.*/

paragraph = nil


//Resolving Strong Reference Cycles for Closures

/*NOTE
Swift requires you to write self.someProperty or self.someMethod (rather than just someProperty or someMethod) whenever you refer to a member of self within a closure. This helps you remember that it’s possible to capture self by accident.*/
/*
@lazy var someClosure: (Int, String) -> String = {
    [unowned self] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}

@lazy var someClosure: () -> String = {
    [unowned self] in
    // closure body goes here
}
*/


//Weak and Unowned References

/*NOTE
If the captured reference will never become nil, it should always be captured as an unowned reference, rather than a weak reference.*/

class HTMLElement2 {
    
    let name: String
    let text: String?
    
    @lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
}

var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
println(paragraph2!.asHTML())
// prints "<p>hello, world</p>"

paragraph = nil
// prints "p is being deinitialized"


























