
// custom ops
operator prefix --> {}
operator prefix >> {}
operator prefix * {}

// curry 2 level
@prefix func --> <A,B,C> (left:(A,B)->C) -> (A->(B->C)) {
    return {
        (a:A) -> (B->C) in
        return {
            (b:B) -> C in
            return left (a,b)
        }
    }
}

// curry 3 level
@prefix func --> <A,B,C,D> (left:(A,B,C)->D) -> (A->(B->(C->D))) {
    return {
        (a:A) -> (B->(C->D)) in
        return -->{
            (b:B, c:C) -> D in
            return left(a,b,c)
        }
    }
}

// curry 4 level
@prefix func --> <A,B,C,D,E> (left:(A,B,C,D)->E) -> (A->(B->(C->(D->E)))) {
    return {
        (a:A) -> (B->(C->(D->E))) in
        return -->{
            (b:B, c:C,d:D) -> E in
            return left(a,b,c,d)
        }
    }
}

// curry example
func add(a:Int, b:Int, c:Int, d:Int) -> Int {
    return a + b + c + d
}

(-->add)(1)(2)(3)(4)


// composition
@infix func >> <A, B, C> (left:A->B, right:B->C) -> (A->C) {
    return {
        (a:A) -> C in
        return right(left(a))
    }
    
}

// composition example
func plusOne(x:Int) -> Int {
    return x + 1
}

func plusTwo(x:Int) -> String {
    return String(x) + "2"
}

(plusOne >> plusTwo)(10)

// flip
func flip<A,B,C> (f:(A,B)->C) -> ((B,A)->C) {
    return {
        (b:B, a:A) in
        return f(a,b)
    }
}

func divide (a:Int, b:Int) -> Int {
    return a / b
}
var fd = flip(divide)
fd(5, 10)

// repetition
@infix func * (left:String, right:Int) -> String {
    var result = left
    for i in 1..right {
        result += left
    }
    return result
}

// repetition example
"a" * 10














































