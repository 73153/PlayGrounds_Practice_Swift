// Playground - noun: a place where people can play

import Cocoa

// Classes are particularly simple to create in Swift, simply use the keyword 'class' to 
// create a new class. A property declaration inside a class is the same as a variable or
// constant, but inside the context of a class. The same applies to method and function 
// declarations. Here is a simpel class:
class Person1 {
    let name = "Unknown Person";
    var age = 0;
    
    func describe() -> String {
        return name + " is \(age) years old.";
    }
}

// Creating an instance of an class is extremely simple, you just have to put parentheses
// after the class name. You then just use dot notation to access the properties and
// methods inside the class.
var person = Person1();

person.age;
person.describe();

// As you can see above, our Person isn't actually a specific person as of yet - rather the
// fields are just placeholders. Any Person class at the moment will have the same name and
// age. We can create an initializer (a.k.a constructor) by just creating an init() method
// without the func flag, as below. We can access variables in the class context rather
// than variables in the init context by the use of the keyword 'self'.
class Person2 {
    var name: String;
    var age: Int;
    
    init(name: String, age: Int) {
        self.age = age;
        self.name = name;
    }
    
    func describe() -> String {
        return name + " is \(age) years old.";
    }
}

// Now we are able to create an instance of Person2, with a given name and age, and we are
// able to see this in the description. We pass parameters to the initializer a little 
// differently to a typical function.
var jim = Person2(name: "Jim", age: 21);

jim.age;
jim.describe();

// You can also use deinit to create a cleanup function inside your class. This isn't going
// to be needed in code like the above, however here's an example of setting the age and
// name to nil in the deinit. The deinit does not take any parameters, so the parentheses
// are omitted.
class Person3 {
    var name: String;
    var age: Int;
    
    init(name: String, age: Int) {
        self.age = age;
        self.name = name;
    }
    
    func describe() -> String {
        return name + " is \(age) years old.";
    }
    
    deinit {
        name = "deinit name";
        age = 0;
    }
}

// You can create subclasses by specifying their superclass name after their name, split
// by a colon (similar to variable declarations). There is no requirement for any classes
// to sublcass any standard classes, so you can include superclasses only if needed. You 
// can override superclass method implementations by using override. If you accidentally
// omit the override flag, then it will be treated as an error by the compiler. This is 
// the same in reverse, i.e. if you add the flag to a method not existing in the superclass
class Student {
    var name: String;
    var course: String;
    var age: Int;
    
    func describe() -> String {
        return name + " is a \(age) year old student studying \(course).";
    }
    
    init(name: String, course: String, age: Int) {
        self.name = name;
        self.course = course;
        self.age = age;
    }
}

class LawStudent: Student {
    override func describe() -> String {
        return name + " is a \(age) year old Law student.";
    }
}

Student(name: "Peter", course: "Math", age: 24).describe();
LawStudent(name: "Jasmine", course: "Law", age: 22).describe();

// Class properties can have a set getter and setter in order to be returned or set by the
// developer. This ensures that a property can be returned in a given way, if chosen by the
// developer. The example below returns the set value of number multiplied by 5 when
// returned by the class. You cannot have a custom getter without having a custom setter.
// The value passed to the setter can be accessed via the 'newValue' variable. This is an
// implicit naming. If you want to specify your own naming, you can specify this in the
// setter signature by adding parentheses. set(number: Int) below.
class Number {
    var number = 0;
    
    var value: Int {
        get {
            return number;
        }
    
        set {
            number = newValue;
        }
    }
}

var number = Number();
number.value;

number.value = 5;
number.value;

// You can also use willSet and didSet to provide code that is run before and after setting
// a new value, even if you don't need to compute the property. Note that the reason for
// Int = 0 here is to define a default value - this is required when there is no given
// initializer. Below is an example of this - when the total field is changed, the value 
// is changed to the total if the total is odd, or total - 1 if it is even.
class OddNumber: Number {

    var total: Int = 0 {
        didSet {
            value = total - (total % 2 == 0 ? 1 : 0);
        }
    }
}

var odd = OddNumber();

odd.total = 6;
odd.total;
odd.value;

odd.total = 5;
odd.total;
odd.value;

// The main difference between methods and functions is a difference in parameters. In a
// function, the parameter names are only visibile from inside the function itself, however
// a method includes parameter names in the call to the method. Below, you can see the
// parameter name passed in to the incrementBy() method. However, the parameter name does
// not have to be used for the first parameter in the method.
class Counter {
    var count: Int = 0;
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times;
    }
}

var counter = Counter();
counter.incrementBy(2, numberOfTimes: 7);

// You can use optional values when accessing properties of classes, again by using the
// question mark (?). This allows you to run into nests without worrying about checking
// nil beforehand (in the traditional sense). The below case will check for odd being nil
// before checking value, which means that the result of this statement will either be 
// odd.value or nil.
let oddValue: Int? = odd.value;
