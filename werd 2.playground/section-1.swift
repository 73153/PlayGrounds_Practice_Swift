// Playground - noun: a place where people can play

import UIKit
import Foundation

var frames = ["Sam","Car","S"]
println(frames)

func shuffle<T>(var list: Array<T>) -> Array<T> {
    for i in 0..list.count {
        let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
        list.insert(list.removeAtIndex(j), atIndex: i)
    }
    return list
}
shuffle([1, 2, 3, 4, 5, 6, 7, 8])        // e.g., [6, 1, 8, 3, 2, 4, 7, 5]
shuffle(["hello", "goodbye", "ciao"])    // e.g., ["ciao", "goodbye", "hello"]
shuffle(frames)

extension String {
    
    // single subscript s[n]
    
    subscript (idx: Int) -> String? {
        get {
            if (idx < countElements(self)) {
                return self.substringWithRange(
                    Range( start: advance( self.startIndex, idx),
                        end: advance( self.startIndex, idx + 1 )  )
                )
            }
            else {
                return nil
            }
        }
    }
    
}




