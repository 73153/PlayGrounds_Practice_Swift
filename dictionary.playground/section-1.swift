var airports = ["TYO":"Tokyo", "DUB":"Dublin"]

println("The dictionary of airports contains \(airports.count) items")
println()

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    println("The old value for DUB was \(oldValue).")
}
println()

if let airportName = airports["DUB"]
{
    println("The name of the airport is \(airportName).")
} else {
    println("That airport is not in the airports dictionary.")
}
println()

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DUB")
{
    println("The removed airport's name is \(removedValue).")
}

println()

for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}
println()

for airportCode in airports.keys {
    println("Airport Code: \(airportCode)")
}
println()

for airportName in airports.values {
    println("Airport name: \(airportName)")
}
println()

let airportCodes = Array(airports.keys)
let airportNames = Array(airports.values)

var nameOfIntegers = Dictionary<Int, String>()
nameOfIntegers[16] = "Sixteen"
nameOfIntegers = [:]

