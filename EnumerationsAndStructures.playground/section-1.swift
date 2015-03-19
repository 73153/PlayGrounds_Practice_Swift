// Playground - noun: a place where people can play

import Cocoa

// To create a new enumeration, simply use the enum keyword. Like all other types of class,
// an enumeration can have methods associated with itself. An easy enumeration to use is 
// that included in the Apple Swift book of a suite of cards. In this case, because the 
// type of the enumeration is Int, you only need to specify the value of the first integer,
// which in this case is Ace, which we set equal to 1. All other values increment from this
// value in order, meaning we end up with a deck of 1-13.
enum Rank: Int {
    case Ace = 1;
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King;
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "Ace";
        case .Jack:
            return "Jack";
        case .Queen:
            return "Queen";
        case .King:
            return "King";
        default:
            return String(self.toRaw());
        }
    }
}

// Enumerations have both a toRaw() and fromRaw() function to allow converstion between raw
// and enumeration values. There is not necessarily a raw value associated with a member
// value, as sometimes a raw value doesn't make sense. Let's take a look at a King card.
let king = Rank.King;

king.simpleDescription();
king.toRaw();

// If you assign a value or access the King (or any other) enumeration member, you need to
// specify the full name (a.k.a Rank.King) - whereas inside you can specify the abbreviated
// form (.King or just King) because the value of the enumeration (in this case Rank) is 
// known previously. Below is an example of an enumeration per card suite, with the ability
// to determine is a suite is a red or black suite.
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
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black";
        case .Diamonds, .Hearts:
            return "red";
        }
    }
}

let hearts = Suit.Hearts;

hearts.color();
hearts.simpleDescription();

// You can create a structure using the struct keyword. Structures support most of the same
// behaviours as classes, however keep in mind that classes are passed by reference, but
// structures are always copied when passed in.
struct Card {
    var rank: Rank;
    var suit: Suit;
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let eightOfHearts = Card(rank: .Eight, suit: .Hearts);

eightOfHearts.simpleDescription();

// Members of an enumeration can have different values associated with them. This is not
// same as the raw value which will persist after you set it when you define the 
// enumeration. Instances of the same enumeration member can have different values
// associated with them. These instances are defined when you create the member. 
enum NumberString {
    case Number(Int);
    case Text(String);
}

let number = NumberString.Number(200);
let text = NumberString.Text("400");
var result = "";

switch number {
case let .Number(value):
    result = "The value is \(value)";
case let .Text(text):
    result = "The value is \(text)";
}