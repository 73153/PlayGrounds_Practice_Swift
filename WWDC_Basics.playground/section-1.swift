// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

for i in 0..10
{
    i * i
}

let color = NSColor.blueColor()

let attrStr = NSAttributedString(string: str, attributes: [NSForegroundColorAttributeName: color, NSFontAttributeName: NSFont.systemFontOfSize(42)])

let imageNames = [NSImageNameUser, NSImageNameUserAccounts, NSImageNameUserGroup]

let images = imageNames.map { NSImage(named: $0) }
images

let image = images[0]
let imageView = NSImageView(frame: NSRect(x: 0, y:0, width: 512, height: 512))

imageView.image = image
imageView.imageScaling = .ImageScaleProportionallyUpOrDown

imageView

