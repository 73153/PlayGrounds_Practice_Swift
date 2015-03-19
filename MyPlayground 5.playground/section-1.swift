// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var images: UIImage?
var imagesArray: NSArray?
    imagesArray = NSArray(objects: [UIImage(named: "bg1"), UIImage(named: "bg2"), UIImage(named: "bg3"), UIImage(named: "bg4")])
    images = UIImage.animatedImageWithImages(imagesArray, duration: 30.0)
println(imagesArray?.count)