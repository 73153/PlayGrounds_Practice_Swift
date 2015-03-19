// same old functions
func add(a:Int, b:Int) -> Int {
    return a + b
}

// void functions
func sayHello() {
    println("hello")
}

// return multiple values
func httpReq(url:String) -> (Int, String) {
    return (404, "not found")
}

// external names
func divide(numerator a:Double, denominator b:Double) -> Double {
    return a / b
}
divide(numerator: 10, denominator: 2)

// external names short hand
func getChapterTitle(#courseId: Int, #chapterIndex: Int) -> String {
    return "Overview"
}
getChapterTitle(courseId: 2, chapterIndex: 0)

// default parameters (use _ to avoid typing external names for arguments with default values)
func setPosition(_ x:Double = 0, z:Double = 1, y:Double = 0) {
    println("point is now at \(x), \(y)")
}
setPosition(10, y: 10)
setPosition(5)
setPosition()

// variadic parameters (appear at the end of the argument list, even after default arguments)
func avg(numbers:Double...) -> Double {
    var avg:Double = 0
    for i in numbers {
        avg += i
    }
    return avg / Double(numbers.count)
}
avg(1,2,3,1,2,3)

// mutable args - pass by value - (by default func args are immutable)
func addOne(var a:Int) -> Int {
    a += 1
    return a
}
addOne(4)

// pass by reference
func swap(inout a:Int, inout b:Int) {
    let temp = a
    a = b
    b = temp
}
var x = 10, y = 20
swap(&x, &y)
println("x = \(x), y = \(y)")
