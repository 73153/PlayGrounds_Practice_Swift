// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


//class Counter {
//    var count = 0
//    
//    func increment() {
//        count++
//    }
//    
//    func incrementBy(amount: Int) {
//        count += amount
//    }
//    func reset() {
//        count = 0
//    }
//}

//let counter = Counter()
//
//counter.increment()
//counter.incrementBy(5)
//counter.reset()


class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}