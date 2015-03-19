import UIKit

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var inc=makeIncrementer()
inc(7)

// ***********

func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

let result = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })

numbers
result

let result2 = numbers.map({ number in 3 * number })
result2

let sortedNumbers = sort(numbers){ $0 < $1 }
sortedNumbers

let result3 = numbers.filter() { $0 % 2 == 0 }
result3

