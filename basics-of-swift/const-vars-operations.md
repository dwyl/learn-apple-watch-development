# **Constants, Variables & Basic Operations**
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
