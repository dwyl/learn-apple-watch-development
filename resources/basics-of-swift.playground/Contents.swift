//: Playground - noun: a place where people can play

import UIKit

// e.g. 1

// first name is something that doesn't change much (hopefully)
let firstName = "Sohil"
// age is something that does change in the future
var age = 24

//this will print the line in the console
print("My name is \(firstName) and I am \(age) years old.") //string interpolation

let explicitName: String = "Sohil" //not required to say that it is of type String
let implicitName = "Sohil" // Swift infers that you want the constant to be a string
let implicitDouble = 78.0
let implicitInt = 24
let addition = 1 + 1
let subtraction = 2 - 2
let multiplication = 3 * 3
let division = 4 / 4

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

// e.g. 3
// for-in statement
for item in shoppingList {
    print("We need to buy \(item)")
    // if-else Conditionals
    if (item == "Eggs") {
        print("we have eggs!")
    } else {
        print("we have Milk!")
    }
}
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

//e.g. 5
func greet(name: String) -> String {
    return "Hello \(name)"
}

print(greet(name: "Sohil"))

func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
}

print(multiply(num1: 2, num2: 2))

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


//Lets look at this example
// e.g. 7
// We have n array of ages in an unordered list
let listOfAge = [1, 32, 3, 66, 31, 64, 9, 22]

// We can use an inbuilt Swift method called sorted(by:) to sort the order
// sorted(by:) method doesn't alter the existing array it returns a new one

// A - pass in the function
func backward(_ i1: Int, _ i2: Int) -> Bool {
    return i1 < i2
}
var ascendingAge = listOfAge.sorted(by: backward)
print("list of \(ascendingAge)")
// ascendingAge is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// B - use closure expression syntax
ascendingAge = listOfAge.sorted(by: { (i1: Int, i2: Int) -> Bool in
    return i1 < i2
})

// C - refactor as Swift infers type from Context

// Because Swift infers the types of the parameters and return value
// i.e. it takes (Int, Int) -> Bool and returns Bool
// we can simplify the closure further
ascendingAge = listOfAge.sorted(by: { i1, i2 in return i1 < i2 })

// D - refactor further using shorthand argument names & Operator Methods

// Swift provides shorthand argument names to inline closures, hence we can access arguments using $0, $1, $2 etc...
ascendingAge = listOfAge.sorted(by: { $0 < $1 })

// There is an even shorter way to write this as the return value from
// closure matches the exact method provided by sorted(by:)
// i.e. two Int parameters and returns a Bool
ascendingAge = listOfAge.sorted(by: <)
