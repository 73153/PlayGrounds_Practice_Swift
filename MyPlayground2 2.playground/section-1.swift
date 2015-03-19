// Playground - noun: a place where people can play

import Cocoa

//Protocols
//Provide blueprint for methods and properties
//Describe what must be implemented and what the implementation must look like
//Implementation provides the implemnation of the protocol (conforming)

protocol MyProtocol {
    //Protocol goes here
    var someProp:String { get set }
}

//To adopt a protocol
class AdopterClass:MyProtocol {
    var someProp:String
    
    init(someProp:String){
        self.someProp = someProp
    }
}

protocol SerialCodeable {
    var serialCode:String { get set }
}

class Book:SerialCodeable {
    var serialCode:String
    
    init(serialCode:String){
        self.serialCode = serialCode
    }
    
}

var LOR = Book(serialCode: "121453511")
//Protocols can have type and instance methods

//Protocols are like java interfaces
protocol Humanizable {
    func eat()
    class func drink(howMuch:Int) -> Bool
}

class Human:Humanizable {
    func eat(){
        println("The human is eating right now")
        
    }
    class func drink(howMuch: Int) -> Bool {
        println("The human drank \(howMuch) cups of water")
        return true
    }
}
var fred = Human()
fred.eat()
Human.drink(5)

//Use the protocol as mutating 

protocol Toggleable {
    //Going to need to toggle itself
    mutating func toggle()
}

enum OnOffSwitch:Toggleable {
    case Off, On
    
    mutating func toggle(){
        switch self {
        case .Off:
            self = On
        case .On:
            self = Off
        }
    }
}


var wallSwitch = OnOffSwitch.Off

wallSwitch == OnOffSwitch.Off

wallSwitch.toggle()

wallSwitch == OnOffSwitch.Off
wallSwitch == OnOffSwitch.On

protocol Walkable {
    var name:String { get set }
    func walk(#steps:Int)
}

//implement lots of class off this protocol

class Human2:Walkable {
    var name = "human"
    func walk(#steps: Int) {
        print("The \(self.name) is walking \(steps) steps")
    }
}

class Dog:Walkable {
    var name = "dog"
    func walk(#steps: Int)  {
        print("Walking the \(self.name) \(steps) steps")
    }
    
    func bark(){
        println("WOOF")
    }
}

class PlayTime {
    func takeAWalk(walkable:Walkable) {
        println("Talking the \(walkable.name) for a walk")
        walkable.walk(steps: 10)
        
        //downcasting
        //declare a constant dog and assign to - is walkable a Dog? if yes then create as instance of dog instance
        if walkable is Dog {
            println("was a dog")
        }else {
            println("was not a dog")
        }
    }
}

var playTime = PlayTime()
var dog = Dog()
playTime.takeAWalk(dog)

var human = Human2()
playTime.takeAWalk(human)


//Most of the time you get back an Array of AnyObject[]
var mixedArray:Any[] = ["3",2,1,dog]
//in this array it will be of type any (apart from functions)
for something:Any in mixedArray {
    if something is Dog {
        println("This was a dog")
    }
}

//Implements Walkable too
protocol Excercisable: Walkable {
    func run(#miles:Double)
}

protocol Joggable {
    func jog(#miles:Double)
}

func excerizeRouting(excercizer: protocol<Walkable, Joggable>){
    excercizer.jog(miles:5.2)
    excercizer.walk(steps:5000)
}

//Can make a protocol optional
@objc protocol Likeable {
    //optional function called smile
    @optional func smile() -> String
}

class HappyEmotion:Likeable {
    //We can still implement smile
    func smile() -> String {
        return "Smiling"
    }
}

class Person:Walkable {
    var name:String = "Phred"
    func walk(#steps: Int){
        
    }
    func currentMood(likeable:Likeable?){
        if let greeting = likeable?.smile?(){
            println(greeting)
        }
    }
}
var phred = Person()
var happiness = HappyEmotion()
phred.walk(steps: 5000)
phred.currentMood(happiness)

//protocol composition
//class TrackStar:Excercisable {
//    var name = "human"
//    func run(#mile:Double){
//        
//    }
//    func walk(#steps:Int){
//        
//    }
//}


//Generics
//Allow you to write generic code
//inout - outside of the function
func swapTwoInts(inout a:Int, inout b:Int){
    let tempA = a
    a = b
    b = tempA
}

var a = 1, b = 3
swapTwoInts(&a, &b)
a
b

//generics work with any type 
//used T for any type - a and b must be the same
//so re write as below
func swapTwoValues<T>(inout a:T, inout b:T){
    let tempA = a
    a = b
    b = tempA
}

var ab = "cat" , bc = "dog"
swapTwoValues(&ab, &bc)
ab
bc


//Stack structure - using generics
struct Stack<T> {
    var items = T[]()
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop() -> T{
        return items.removeLast()
    }
}

var stringStack  = Stack<String>()
stringStack.push("Ross")
stringStack.push("Candy")
stringStack.push("Rodney")
stringStack.pop()

//Equatable is if they include == or !=
func findIndex<T:Equatable>(array:T[],valueToFind:T) -> Int? {
    for(index, value) in enumerate(array){
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//As its generic we can do stuff like this - with any type
let doubleIndex = findIndex([3.131515,0.1,0.25], 9.3)
let stringIndex = findIndex(["H","I","M"],"I")

//Can make generic containers
protocol Container {
    //Use item type for now
    //Protocol dosnt specify type .. yet
    typealias ItemType
    
    mutating func append(item:ItemType)
    var count: Int { get }
    subscript(i:Int) -> ItemType { get }
}

//Makes sure that the items are the same types in stack using where
func allItemsMatch<C1:Container,C2:Container
    where C1.ItemType == C2.ItemType,
    C1.ItemType:Equatable>
    (someContainer:C1,anotherContainer:C2) -> Bool {
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        //check each pair
        for i in 0..someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        return true
        
}



//Completely generic stack
struct Stack2<T>:Container {
    var items = T[]()
    
    mutating func push(item:T){
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
    
    //can be commented out and it still works
    //typealias ItemType = String
    
    mutating func append(item: T){
        self.push(item)
    }
    
    var count:Int{
        return items.count
    }
    
    subscript(i:Int) -> T{
        return items[i]
    }
    
}

//Because its completely generic we can do this using the same stack struct

var sStack = Stack2<String>(items: ["Hi","There"])
sStack[0]
sStack.count

var iStack = Stack2<Int>(items: [1,2,3,4,5])
iStack[0]
iStack.count

var bunchOfStrings = Stack2<String>()
bunchOfStrings.append("hi")
bunchOfStrings.append("there")
bunchOfStrings.append("friends")

var bunchOfStrings2 = Stack2<String>(items:["hi","there","friends"])

allItemsMatch(bunchOfStrings, bunchOfStrings2)


//More Closures II - Skip Wilson 
func outer(howMuch:Int) -> () -> Int{
    var total = 0
    
    func inner() -> Int {
        total += howMuch
        return total
    }
    
    return inner
}

let incrementBy5 = outer(5)

//Inner function using the outerfunction + we keep a reference to the function
incrementBy5()
incrementBy5()
incrementBy5()
incrementBy5()

//We now want to start again by 1
let incrementBy1 = outer(1)
incrementBy1()

let incrementBy1Again = incrementBy1
incrementBy1()
incrementBy1Again()

//Create a closure for web requests

let url = "http://baconipsum.com/api/?type=meat-and-filler"

let nsUrl = NSURL(string:url)
let task = NSURLSession.sharedSession().dataTaskWithURL(nsUrl) {(data,response,error) in println(NSString(data:data,encoding:NSUTF8StringEncoding))
}

task.resume()

var waiting = true
//YOU MUST COMMENT OUT THE BELOW OR IT KEEPS RUNNING FOREVER
//while(waiting){
//    NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode,beforeDate:NSDate())
//    usleep(10)
//}
//

//Use closures for callback methods


























