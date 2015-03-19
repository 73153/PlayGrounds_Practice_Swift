import Cocoa

// initialization
var message = String()

// length
message = "hello World"
countElements(message)

// empty
if message.isEmpty {
    "message is empty"
} else {
    "message is not empty"
}

// concatenation
var instruction = "hack!"
message + instruction

// interpolation
"\(message) & \(instruction)"

// iteration
for m in message {
    m
}

// suffix, prefix equality
message.hasPrefix("hello")
message.hasSuffix("World")

// case change
message.uppercaseString
message.lowercaseString

// unicode to ascii
for c in message.utf8 {
    c
}