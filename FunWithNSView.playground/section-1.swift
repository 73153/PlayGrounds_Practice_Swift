// Playground - noun: a place where people can play

import Cocoa
import XCPlayground


class CustomView: NSView {
    init(frame: NSRect) {
        super.init(frame: frame)
        
        antibez.moveToPoint(NSPoint(x: 10 , y: 10))
        for i in 0..25
        {
            antibez.lineToPoint(NSPoint(x: 20 + 10 * (25-i), y: 20 + 10 * i))
            antibez.moveToPoint(NSPoint(x: 10 + 10 * (i), y: 10 ))
            
        }
    }
    override func drawRect(dirtyRect: NSRect) {
        color.setFill()
        NSRectFill(self.bounds)
        antibez.stroke()
        
    }
    
    var color = NSColor.blueColor()
    
    var antibez = NSBezierPath()
}
var view = CustomView(frame:
    NSRect(x: 0, y: 0, width: 300, height: 300))

XCPShowView("chart", view)
