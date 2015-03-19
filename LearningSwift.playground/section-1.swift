// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func makeIncrement() -> (Int -> Int) {  //此处有笔记
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}

var number = makeIncrement()
var result = number(7)

//func makeIncrement(number:Int) -> Int {
//    return number + 1
//}
//
//var result = makeIncrement(2)

func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for a in list {
        if condition(a) {
            return true
        }
    }
    return false
}

func condition(number: Int) -> Bool {
    if number == 11 {
        return true
    }
    else {
        return false
    }
}

var isMatch = hasAnyMatches([1,2,3,4,5,6,11], condition)

var numbers = [1,2,3]

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map({number in
    1+number
    })

sort(numbers) {$0 > $1}
numbers



