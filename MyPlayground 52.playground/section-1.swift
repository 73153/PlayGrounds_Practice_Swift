import Security
import Foundation

class User {
    var username: String = ""
    var passwordHash: String?
    
    var password: String {
    get {
        return self.passwordHash!
    }
    
    set {
        self.passwordHash = "\(newValue.hashValue)"
        var secret: NSData = newValue.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        let query = NSDictionary(objects: [kSecClassGenericPassword, "MyService", "Some account", secret], forKeys: [kSecClass, kSecAttrService, kSecAttrAccount, kSecValueData])
        
        let status = SecItemAdd(query as CFDictionaryRef, nil)
    }
    }
}

let user = User()
user.username = "jp@realm.io"
user.password = "1password"

"username \(user.username) and password: \(user.password)"

reflect(User()).count
reflect(User())[0]
reflect(User())[0].0
reflect(User())[1].1.valueType is String?.Type


// Mangled name of Swift class.
NSStringFromClass(User.self)

class Foo : NSObject {
}

var f:AnyObject = Foo()

f.description
f.isKindOfClass(Foo)

// Apple Example: Lister (written in Swift)
