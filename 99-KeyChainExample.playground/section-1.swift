// Playground - noun: a place where people can play

import Cocoa
import Foundation
import Security

var secret: NSData = "Top Secret".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)

let query = NSDictionary(objects: [kSecClassGenericPassword, "MyService", "Some account", secret], forKeys: [kSecClass, kSecAttrService, kSecAttrAccount, kSecValueData])

let status = SecItemAdd(query as CFDictionaryRef, nil)

