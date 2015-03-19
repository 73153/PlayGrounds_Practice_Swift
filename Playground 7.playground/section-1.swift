// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




let imageView = UIImageView(image: UIImage(named: "/Users/Buusmann/bg.jpg"))
imageView.frame = CGRectMake(0, 0, 1024, 768)

var getScreenSize = UIScreen.mainScreen().bounds
var loaderRect = UIView(frame: CGRectMake(CGRectGetMaxX(getScreenSize) - 100, CGRectGetMaxY(getScreenSize) - 100, 600, 600))
loaderRect.layer.cornerRadius = loaderRect.frame.size.width / 2

var effectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))

effectView.frame = CGRectMake(0, 0, 1024, 768)





loaderRect.addSubview(imageView)
loaderRect.addSubview(effectView)




func square(a:Float) -> Float {
    return a * a
}

func cube(a:Float) -> Float {
    return a * a * a
}

func averageOfFunction(a:Float,b:Float,f:(Float -> Float)) -> Float {
    return (f(a) + f(b)) / 2
}

averageOfFunction(3, 4, square)
averageOfFunction(3, 4, cube)


var myMoney = [25000, 13000, 500, 45, 2000]

myMoney.map({"\($0)DKK"})
myMoney.filter({$0 < 13000})
myMoney.reduce(0, +)
println(myMoney)