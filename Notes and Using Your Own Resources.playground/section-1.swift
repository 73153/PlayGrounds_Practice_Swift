// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//******NOTES ********
// What are playgrounds?
// Swift Code, Resources and a Timeline

// Every time you edit the code top to bottom is run
// The time stepper in bottom right in assistant - specifies how long it will run after execution. The slider can be used for live viewing of a specific piece of code which is pretty useful.

// What to use playgrounds for?
// Learn swift - by playing around
// Great for teaching people to program
// Great for code development - especially algorithms
// Any drawing code is fast in playgrounds
// Processing code is fast in playgrounds
// Experimentation 
// Try out an API in playgrounds as you can see the results quickly - no project needed , keep a playground open for quick access

//Many values have quick looks in playgrounds 

//You can easily use your own resources in playgrounds

// Working with playgrounds

for i in 0..100 {
    i * i
}

let color = NSColor.blueColor()
let attrStr = NSAttributedString(string: str, attributes:[NSForegroundColorAttributeName: color, NSFontAttributeName: NSFont.systemFontOfSize(42)])

let imageNames = [NSImageNameUser, NSImageNameUserAccounts,NSImageNameUserGroup]

let images = imageNames.map {
    NSImage(named: $0)
}

images

let image = images[0]

let imageView = NSImageView(frame: NSRect(x: 0, y: 0, width: 512, height: 512))

imageView.image = image
imageView.imageScaling = .ImageScaleProportionallyUpOrDown

imageView

//Open file inspector to get resource paths and use them in the playground

//Use this to get the resource
//let myImage = NSImage(named: "Xcode")
//imageView.image = myImage











