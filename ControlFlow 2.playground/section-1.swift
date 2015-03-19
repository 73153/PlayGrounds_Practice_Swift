for i in 0..3 {
    println(i)
}

var cube = 1
for _ in 0..3 {
    cube *= 3
}
cube

let apps = ["mobile academy", "vip games", "movie star"]
for app in apps {
    println(app)
}

let courses = [2: "mobile photography", 3: "negotiation skills"]
for (key, title) in courses {
    println("\(title) has key: \(key)")
}

for var i = 0; i < 3; i++ {
    println(i)
}

var i = 3
while (i < 6) {
    println(i)
    i++
}