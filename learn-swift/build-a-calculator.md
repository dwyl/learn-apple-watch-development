# Build a Calculator

Now that you're equipped with the basics of **_Swift_**, we'll be using some of the skills to build our very first iOS app.

**You'll need:**  
* Xcode (version **8.1** or _above_)
    * You can follow along in other versions but you may encounter some issues  

>**Content**  
[Xcode](# Familiarise yourself with Xcode)  
[Setup](# Project Setup)  
[MVC](# Understanding MVC)  
[Numbers](# Numbers)  
[Operators](# Operators)  
[Product](# Final Product)

### Project Setup 
Lets kick things off by creating a ** new Project**

| **1. select new project**  | **2. select type of application** |
| ------------- | ------------- |
|![1](https://cloud.githubusercontent.com/assets/2305591/19889924/a8171082-a02f-11e6-9018-1ed50f9c755b.jpg) | ![2](https://cloud.githubusercontent.com/assets/2305591/19889932/b029bd4c-a02f-11e6-8fcb-5622aa5cead8.jpg) |

| **3. select project name** (calculator) | **4. voila!** |
| ------------- | ------------- |
| ![3](https://cloud.githubusercontent.com/assets/2305591/19889933/b02e6c66-a02f-11e6-8f5b-cfebefd99238.jpg) | ![4](https://cloud.githubusercontent.com/assets/2305591/19889934/b0307ace-a02f-11e6-815d-437176f6777d.jpg) |

#### Setup Provisioning by registering an Apple ID

- Add an account if you don't have one setup. (any iTunes account will work, we do not require the special developers account)
- Plug in your iPhone
- You should now be able to link your phone to this registered account

<img width="1680" alt="screen shot 2016-11-01 at 12 43 57" src="https://cloud.githubusercontent.com/assets/2305591/19890329/f180c3e2-a031-11e6-8032-136385846217.png">

_**Known Issue**_  
If you are having trouble connecting your phone or Xcode showing an error message like such:  
![screen shot 2016-11-01 at 12 50 12](https://cloud.githubusercontent.com/assets/2305591/19890475/cb9db0da-a032-11e6-994c-394c32343460.png)  
Then please select your iPhone from the dropdown list shown here:
<img width="1146" alt="screen shot 2016-11-01 at 12 50 37" src="https://cloud.githubusercontent.com/assets/2305591/19890478/dd5c30bc-a032-11e6-8152-ecfaa6332f29.png">
This will solve the issue   
_**Known Issue**_



### Familiarise yourself with Xcode
_**Xcode** is an **IDE** which will allow us to develop software for macOS, iOS, WatchOS and tvOS._ So no surprises🙊 on what we'll be using for developing our calculator app(_and any future app for that matter_)

**Screen layout**
<img width="1680" alt="screen shot 2016-11-01 at 12 37 55" src="https://cloud.githubusercontent.com/assets/2305591/19890378/3b2cf60a-a032-11e6-9d83-7850379db1bc.png">  

* **Navigator**
    * Very useful for navigating around in the project🚥
* **Project Space**
    * Biggest screen real-estate to be used for code! 🙌
* **Utilities**
    * Used for viewing/managing file metadata (**File Inspector** 📁)
    * As well as for viewing details of what has been selected in the editor

    **TIP:** Spend some time getting use to the IDE and it's layout

### Understanding MVC
![mvc](https://cloud.githubusercontent.com/assets/2305591/20435146/e24db028-ada2-11e6-8fc0-bd2018fc7995.png)
**MVC (Model View Controller)** is a design pattern for building applications, It splits up the application into three components:
* **Model**
    * What your application is
    * e.g. functions that do calculation for us
* **Controller**
    * How your **_Model_** is displayed to the user (UI Logic)
    * It interprets the **_Model_** information for the **_View_**
    * e.g. what text/buttons should be displayed
* **View**
    * Things the **_Controllers_** will use to put things on screen
    * such as Buttons, labels
    * and getting input data from the users etc.


#### **Main Relationship between MVC**

* **_Controller_** can talk to the Model
* **_Controller_** can talk to the View
* **_Model_** and **_View_** never talk to each other
    * **_Model_** is UI independent
    * **_View_** is completely UI dependent
    * All Comms between the two have to pass through the **_Controller_**
* **_View_** can talk to the **_Controller_** in a structured (pre-defined) way. (we'll find out more when we get coding)
* **_Model_** can't talk to the **_Controller_**  
    * However if data changes in the **_Model_**, you can _broadcast_📻 the changes which the **_Controller_** can be listening🎶 for. _(Pub/Sub)_


### Numbers
Enough of me talking lets **build this calculator** already!

#### Interface Builder: In iOS you don't have to code the visuals, just drag and drop them (wire them onto the logic afterwards)

**Our first Button**
- Drag and drop a button from the utilities list
- Edit the text by double clicking
- Edit the Font Size and Colour using the attributes inspector in utilities

<img width="1680" alt="screen shot 2016-11-01 at 14 24 27" src="https://cloud.githubusercontent.com/assets/2305591/19892993/6b877a34-a03f-11e6-9e96-ca02f8989834.png">

- Compile and Run the app in a simulator
- We have our very first app! :smile:

**But nothing happens when we click the button :cry:**

#### Connect the button to from the UI to the controller by creating a method

- open up the Assistant editor to view the `controller` file alongside the `storyboard`
- select the button whilst holding the `control` key
![9gnTm2](http://i.makeagif.com/media/11-18-2016/9gnTm2.gif)  
- drag it into the `ViewController` class
    - Fill in all the information as found in the screenshot below:
<img width="302" alt="screen shot 2016-11-01 at 14 38 07" src="https://cloud.githubusercontent.com/assets/2305591/19893368/d90fb1e2-a040-11e6-9a0e-956f6ca59369.png">
- we have now connected our very first UI item to the controller by creating a method! :smile:

#### Create your layout for the calculator
<img width="1680" alt="screen shot 2016-11-01 at 14 48 28" src="https://cloud.githubusercontent.com/assets/2305591/19894152/df79a846-a043-11e6-8042-d34613056487.png">

#### Now print the digit that you are selecting
<img width="1680" alt="screen shot 2016-11-01 at 15 00 36" src="https://cloud.githubusercontent.com/assets/2305591/19894177/f7fed256-a043-11e6-97a4-80941a66a018.png">
```js
@IBAction func touchDigit(_ sender: UIButton) {
  let digit = sender.currentTitle!
  print("touched \(digit) digit")
}

```

**HINT**
- By selecting the option button and hovering over method names/arguments you'll see a little question mark ❓ (try this by hovering over the UIButton text)
- When you select the given text, it will open up a popup
- selecting the Class Reference link will open up the API Documentation which can be pretty handy when we are trying to find out the method for accessing the title for the digit.    

**HINT**

#### Add a Display to the UI

- select a label from the interface (drag & drop)
- link the label to the controller as an outlet
<img width="1680" alt="screen shot 2016-11-01 at 15 12 45" src="https://cloud.githubusercontent.com/assets/2305591/19895506/f39facb2-a048-11e6-9942-a1992e4b36e0.png">

#### Get rid of the trailing zero

- set a global variable called `userIsTyping` and set it to `false`
- modify the `currentTextInDisplay` with an `if` statement

**HINT**
- **All properties need to have an initial value**

**HINT**

```js
@IBOutlet private weak var display: UILabel!

private var userIsTyping = false

// @IBAction is just for viewing what part of the method is connected to
// the method, by hovering the little grey circle
// func just defining that this is a function
// touchDigit is the name of the method
// (###) contains the argument
@IBAction private func touchDigit(_ sender: UIButton) {
    let digit = sender.currentTitle!

    if userIsTyping {
        let currentTextInDisplay = display.text!
        display.text = currentTextInDisplay + digit
    } else {
        display.text = digit
    }
    userIsTyping = true
}
// You'll notice that I've added the keyword `private` in front of all
// of my functions and methods. This means that it is not open and available
// in the API
```
##### You've built your first ever kind of functioning calculator using swift on iOS! :tada:

### Operators

#### Create our first Operation Key


### Final Product
