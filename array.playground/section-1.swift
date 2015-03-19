var shoppingList: String[] = ["Eggs","Milk"]

shoppingList[0]
shoppingList[1]

var resultText = "The shopping list contains \(shoppingList.count) items."
var statusText = ""

if (shoppingList.isEmpty)
{
    statusText = "The shopping list is empty."
} else {
    statusText = "The shopping list is not empty."
}

shoppingList.append("Flour")
shoppingList += "Backing Powder"
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

resultText = "The shopping list contains \(shoppingList.count) items."

shoppingList[0] = "Six eggs"
shoppingList[4...6]=["Bananas","Apples"]

shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)
let apples = shoppingList.removeLast()

for item in shoppingList
{
    println(item)
}

for (index, value) in enumerate(shoppingList)
{
    println("Item \(index+1): \(value)")
}

var someInts = Int[]()
someInts.append(3)
someInts = []

var threeDoubles = Double[](count:3, repeatedValue: 0.0)
var anotherThreeDoubles = Array(count:3, repeatedValue: 0.0)
var sixDoubles = threeDoubles + anotherThreeDoubles


