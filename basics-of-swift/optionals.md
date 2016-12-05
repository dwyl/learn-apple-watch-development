# **Optionals**
**are used in situations where a value may be absent.**

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
