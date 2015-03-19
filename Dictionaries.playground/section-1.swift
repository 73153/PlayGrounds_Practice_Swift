import Cocoa

// literal
var countries = ["ae": "United Arab Emirates", "en": "England", "us": "USA"]

// subscript syntax
countries["ae"]

// methods
countries.updateValue("Scotland", forKey: "en")
countries.removeValueForKey("en")

// iteration
var codes = ""
for (key, value) in countries {
    codes += key
}
codes

// keys, values & range to array
var keys = Array(countries.keys)
var value = Array(countries.values)
var range = Array(4...10)

// initializer syntax
var numbers = Dictionary<Int, String>()

// empty dictionary
numbers = [4: "four", 8: "eight"]
numbers.count
numbers = [:]
numbers.count



