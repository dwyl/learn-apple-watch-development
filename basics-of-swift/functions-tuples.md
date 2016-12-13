# **Functions**
**are self-contained chunks of code that perform a specific task.**

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

# **Tuples**
**group multiple values into a single compound value.**

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
