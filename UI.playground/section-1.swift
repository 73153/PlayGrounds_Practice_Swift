import UIKit
import QuartzCore

for i in 0..10 {
    var y = sin((Double(i) / 10.0) * M_PI)
    var z = 10 * cos((Double(i) / 10.0) * M_PI)
}

// User interface
var perspective = CATransform3DIdentity
perspective.m34 = 1.0 / -500.0

var label = UILabel()
label.frame = CGRectMake(0, 0, 320, 320)
label.text = "Hello Edgar"
label.textAlignment = NSTextAlignment.Center
label.textColor = UIColor(hue: 200, saturation: 100, brightness: 50, alpha: 1)
label.font = UIFont(name: "HelveticaNeue", size: 50)
label.layer.borderColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 1).CGColor
label.layer.borderWidth = 2
var rotated = CATransform3DRotate(CATransform3DIdentity, 5.0 * M_PI / 180.0, 0, 0, 1)
label.layer.transform = rotated
label

var view = UIView()
view.frame = CGRectMake(0, 0, 320, 320)
view.layer.sublayerTransform = perspective
view.addSubview(label)
view

var animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
animation.keyTimes = [0, 1]
animation.values = [0, 200]
animation.duration = 2

view.layer.addAnimation(animation, forKey: "translationX")
