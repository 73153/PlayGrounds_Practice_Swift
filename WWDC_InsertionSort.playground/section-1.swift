// Playground - noun: a place where people can play

import Cocoa
import XCPlayground

var data = [91, 48, 57, 8, 11, 61, 1, 46, 43, 11, 76, 5, 96, 92, 5, 91, 62, 13, 99, 73]

func visualize<T>(data: T[], identifier: String)
{
    for x in data
    {
        XCPCaptureValue(identifier, x)
    }
}
visualize(data, "Start")

for x in data
{
    x
}

func exchange<T>(data: T[], i: Int, j: Int)
{
    let temp = data[i]
    data[i] = data[j]
    data[j] = temp
}

exchange(data, 0, 2)

data

func swapLeft<T: Comparable>(data: T[], index: Int)
{
    for i in reverse(1...index)
    {
        if data[i] < data[i - 1]
        {
            exchange(data, i, i-1)
        }
        else
        {
            break
        }
    }
    visualize(data, "Iteration \(index)")
}

swapLeft(data, 6)
data

func iSort<T: Comparable>(data: T[])
{
    for i in 1..data.count
    {
        swapLeft(data, i)
    }
}

iSort(data)
data
