// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var test = 5

var test2 = 2

var test3 = test + test2

import SceneKit
import QuartzCore
var scene = SCNScene()
var cam = SCNCamera()
var camNode = SCNNode()
camNode.camera = cam
camNode.position = SCNVector3Make(0, 15, 30)
camNode.transform = SCNMatrix4MakeRotation(-3.0, 1.0, 0.0, 0.0)

scene.rootNode.addChildNode(camNode)

var light = SCNLight()
light.type = SCNLightTypeSpot
var red = UIColor.redColor()
light.color = red
let spotLightNode = SCNNode()
spotLightNode.light = light
spotLightNode.position = SCNVector3Make(-2, 1, 0)
camNode.addChildNode(spotLightNode)
let boxSide = 15.0
var box = SCNBox(width: boxSide, height: boxSide, length: boxSide, chamferRadius: 0)
var boxNode = SCNNode(geometry: box)
boxNode.transform = SCNMatrix4MakeRotation(-3.0, 1.0, 0.0, 0.0)

scene.rootNode.addChildNode(boxNode)

