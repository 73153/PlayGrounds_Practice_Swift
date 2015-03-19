// Playground - noun: a place where people can play

import Cocoa
import XCPlayground

var data = [58, 33, 20, 95, 43, 96, 98, 18, 62, 1, 28, 69, 13, 37, 66, 68, 45, 87, 13, 41]

for x in data {
    x
}

//Using XCPlayground we can visaulize our results
func visualize<T>(data: T[], identifier: String){
    for x in data {
        XCPCaptureValue(identifier, x)
    }
}

//Used to generate random data
//for i in 0..20 {
//    data.append(Int(arc4random())%100)
//}
//data

visualize(data, "Start")

func exchange<T>(data: T[], i: Int, j: Int){
    
    let temp = data[i]
    data[i] = data[j]
    data[j] = temp
}

//test exchange works
//exchange(data,0,2)
//data

func swapLeft<T: Comparable>(data: T[], index:Int){
    for i in reverse(1...index){
        if data[i] < data[i-1] {
            exchange(data, i, i-1)
        }
        else {
            break
        }
    }
    visualize(data, "Iteration \(index)")
}

//swapLeft(data, 6)
//data

func isort<T: Comparable>(data: T[]){
    for i in 1..data.count {
        swapLeft(data, i)
    }
}

isort(data)
data