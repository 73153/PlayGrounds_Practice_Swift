// no breaks, no fallthrough by default (use comma for multiple conditions)
var button = "Sidebar"
switch button {
case "Retake_Test", "Test_Yourself", "Next_Chapter":
    println("End of chapter")
case "Sidebar", "Home":
    println("Navigation")
default:
    println("no idea!")
}

// range matching
var number = 10
switch number {
case 0..10:println("single")
case 10..100:println("double")
default:println("multiple")
}

// tuple matching
var point = (0, 30)
switch point {
case (0, 0):println("origin")
case (_,0):println("horizontal")
case(0,_):println("vertical")
case (0..100, 0..100):println("inside the box")
default:println("outside the box")
}

// value binding
var anotherPoint = (0, 30)
switch anotherPoint {
case (let x, 0):println("\(x), 0 lies on an horizontal line")
case (0, let y):println("0, \(y) lies on a vertical line")
default:break
}

// where statement
var yetAnotherPoint = (0,0)
switch yetAnotherPoint {
case let(x,y) where x == y:println("x == y")
case let(x,y) where x > y:println("x > y")
default:break
}

