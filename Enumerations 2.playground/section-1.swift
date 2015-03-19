enum Planet {
    case Earth, Mars, Jupiter
}

var planet = Planet.Earth
planet = .Mars

// associate values (variants)
enum Color {
    case RGB(Double, Double, Double)
    case CMYK(Double, Double, Double, Double)
}

var red = Color.RGB(255, 0, 0)
red = .CMYK(10, 0, 0, 0)

switch red {
case let .CMYK(c, m, y ,k):println("\(c)")
default:println("no idea")
}

// raw values
enum ASCII: Character {
    case Tab = "\t"
    case Newline = "\n"
}

var character = ASCII.Tab
println("raw value of character = \(character.toRaw()).")

