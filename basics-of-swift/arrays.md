# **Arrays**
**store values of the same type in an ordered list.**

* There are multiple ways to create, access & modify arrays  

```js
// e.g. 2

var listOfNames = [String]()
listOfNames.append("Sohil")
print("ListOfNames is of type [String] with \(listOfNames.count) items.")

var shoppingList: [String] = ["Eggs", "Milk"]
//Thanks to Swift’s type inference, you don’t have to write the type of the
// array if you’re initialising it with an array literal containing values of
// the same type.
var shoppingListV2 = ["Eggs", "Milk"]

//Accessing items inside of the array
var firstItem = shoppingListV2[0] //arrays are zero index
print("we need to buy\(firstItem) & (shoppingListV2[1]")
```
