# **Closures**
**are self-contained blocks of functionality that can be passed around and used in your code.**

_But what does that actually mean?_ (Basically they are aware of their surroundings!😲 ) _this can be a very **powerful** tool!_

```js
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

```

**These are just the absolute basics that will be required, We recommend you read through the [Language Guide](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309)**
