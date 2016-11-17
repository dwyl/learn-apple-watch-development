# Back to basics

##### The basic concepts are quite similar in almost all programming languages and _Swift_ is no different.

_The examples with each fundamental can be copied into a playground on Xcode_



**Constants, Variables & Basic Operations**
_associates a name with a value [integer, string]_
* Constant `let` cannot be changed once it is set
* Variables `var` can be set to a different value in the future

```js
// e.g. 1

// first name is something that doesn't change much (hopefully)
let firstName = "Sohil"
// age is something that does change in the future
var age = 24

//this will print the line in the console
print("My name is \(firstName) and I am \(age) years old.") //string interpolation
```
One very cool thing that _Swift_ does for us is that it automatically recognises the type without us having to manually input it as such
```js
let explicitName: String = "Sohil" //not required to say that it is of type String
let implicitName = "Sohil" // Swift infers that you want the constant to be a string
let implicitDouble = 78.0
let implicitInt = 24
// Math operations in Swift
let addition = 1 + 1
let subtraction = 2 - 2
let multiplication = 3 * 3
let division = 4 / 4
```

**Arrays** store values of the same type in an ordered list.

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

**Control-Flow & Conditionals** allows you to use statements such as `for-in`, `while`, `switch` & `if/else` to iterate over sequences or execute different pieces of code based on certain conditions

```js
// e.g. 3
// for-in statement
for item in shoppingList {
  print("We need to buy \(item)")
  // if-else Conditionals
  //
  //
  //
  //
  if (item == "Eggs") {
      print("we have eggs!")
  } else {
      print("we have Milk!")
  }
}
//switch statement
var newItem = "Bread"
//switch statement
var newItem = "Bread"
switch newItem {
case "Eggs":
    print("this is an Egg")
case "Milk":
    print("this is Milk")
default:
    print("item does not exist in the shopping List")
}
```

**Optionals** are used in situations where a value may be absent.

```js
// e.g. 4
// An optional represents two possibilities: Either there is a value, and
// you can unwrap the optional to access that value, or there isn’t a
// value at all.

var myRealAge: Int?
// myRealAge is automatically set to nil
myRealAge = 200
// myRealAge contains an actual Int value of 200
print("My Real age is\(myRealAge)")
// this will print isOptional(200)
print("My Real age is\(myRealAge!)")
// this will print 200, as we have unwrapped the optional
```

**Functions** are self-contained chunks of code that perform a specific task.

```js
//e.g. 5

// function greet takes in a string and outputs a string
func greet(name: String) -> String {
    return "Hello \(name)"
}
print(greet(name: "Sohil"))

// function multiply takes in two integers and outputs another integer
func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
}

print(multiply(num1: 2, num2: 2))
```

**Tuples** group multiple values into a single compound value.

```js
//e.g. 6
//Tuples are particularly useful as the return values of functions
func calc(num: [Int]) -> (add: Int, sub: Int, area: Int) {
    let addAnswer = num[0] + num[1]
    let subAnswer = num[0] - num[1]
    let area = num[0] * num[1]

    return (addAnswer, subAnswer, area)
}

let stats = calc(num: [5, 3])
print(stats)
print(stats.add)
print(stats.0)

print(stats.sub)
print(stats.1)
```
