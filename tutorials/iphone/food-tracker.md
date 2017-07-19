# Food Tracker App

This tutorial will guide you through creating a Food Tracker app, it is based on the [Apple Guide](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1) for developing iOS apps, I found the guide great to work with, but unfortunately it wasn't up to date with all the latest changes that have been made in **Swift v3.1**

Each section will build upon the previous one and eventually help you build an app that lets you view/edit/delete food that you may have eaten.

>**Content**  
[Basic UI](#basic-ui)  

**Before we start you'll need to**
- create a new Xcode project(name it whatever you wish, FoodTracker might be a good) 
- It needs to be an iOS Single View application
- look through the files that Xcode has created for you to get yourself ready to dive in(especially ViewController.swift, Main.storyboard)
- open **Main.storyboard**

### Basic UI


##### Add an Input Field

- Add an input field (found in the Object Library)  
![screen shot 2016-12-01 at 11 47 35](https://cloud.githubusercontent.com/assets/2305591/20792864/0cd49492-b7bc-11e6-880e-962029ebd4ea.png)
  - Align the left and right edges of the text field until you see three vertical layout guides
  <img width="412" alt="screen shot 2016-12-01 at 11 38 05" src="https://cloud.githubusercontent.com/assets/2305591/20792743/6f362ea8-b7bb-11e6-9cae-509382dbb9c6.png">
  - In the Attributes inspector add a placeholder for the input `Enter meal name`
  - Also change the Return Key dropdown from `default` to `Done`
  - Also select the Auto-enabled Return Key checkbox
  <img width="462" alt="screen shot 2016-12-01 at 11 40 28" src="https://cloud.githubusercontent.com/assets/2305591/20792742/6f33a67e-b7bb-11e6-8d6f-e35bc209bc5e.png">


##### Add a Label

- Add a Label to the storyboard
  - Align it so that it is in line with the left side and above the text field
  <img width="381" alt="screen shot 2016-12-01 at 11 49 46" src="https://cloud.githubusercontent.com/assets/2305591/20792913/4cf5c456-b7bc-11e6-8ce9-184a74b4fff6.png">
  - Edit the name of the label by double clicking it and changing it to `Meal Name`


##### Add a Button

- Add a Button to the storyboard
  - Align it so that it is in line with the left side and below the text field
  <img width="383" alt="screen shot 2016-12-01 at 11 52 14" src="https://cloud.githubusercontent.com/assets/2305591/20792983/9eeff6a0-b7bc-11e6-9ebd-97dac89b811c.png">
  - Edit the name of the button by double clicking it and changing it to `Set Default Label Text`

##### Creating an Auto Layout

**Why:question:**
We want the design to be universal so that it works across all iOS devices from iPhone 5 to iPad Pro and this is one way to go about solving this issue.

- Select all items on the storyboard by pressing the shift key and selecting the text field, label and button.
- **Stack** the items together (groups them together either vertically or horizontally, Xcode is clever and will do this automatically)  
<img width="396" alt="screen shot 2016-12-01 at 11 57 12" src="https://cloud.githubusercontent.com/assets/2305591/20793141/879a2f92-b7bd-11e6-8c57-12c7c126ebe9.png">
  - You can view the stacked items in the outline view  
  <img width="245" alt="screen shot 2016-12-01 at 11 59 38" src="https://cloud.githubusercontent.com/assets/2305591/20793185/b5611490-b7bd-11e6-8239-c32a07fdead9.png">
- In the Attributes Inspector change the Spacing field to 12 (this will add space in between each element)
- **Pin** the stacked items to the boundaries by adding new constraints
  - Select the **Pin** menu  
  <img width="131" alt="screen shot 2016-12-01 at 12 01 16" src="https://cloud.githubusercontent.com/assets/2305591/20793297/39dd324e-b7be-11e6-8438-79b4e438f1fe.png">
  - Add New Constraints to the left(0), right(0) and top(60) and select `Contrain to margins` checkbox  
  <img width="262" alt="screen shot 2016-12-01 at 12 04 15" src="https://cloud.githubusercontent.com/assets/2305591/20793343/72cee5de-b7be-11e6-93c3-949ee0fce898.png">
 - Select `Items of New Constraints` from the Update Frames dropdown and Add them  
 ![screen shot 2016-12-01 at 12 06 17](https://cloud.githubusercontent.com/assets/2305591/20793479/1557ebac-b7bf-11e6-9f25-38021df6dddc.png)

- Apply constraints to the left(0) and right(0) to the input field so that it stretches out (make sure that the input field has been selected)  
![screen shot 2016-12-01 at 13 00 44](https://cloud.githubusercontent.com/assets/2305591/20794845/35aca148-b7c6-11e6-8d19-439d0ce89b8d.png)
- Also change the Intrinsic Size from `Default` to `Placeholder` in the Size Inspector  
<img width="447" alt="screen shot 2016-12-01 at 13 02 14" src="https://cloud.githubusercontent.com/assets/2305591/20794920/99c3fc12-b7c6-11e6-9d54-6d3228a78a3e.png">

##### Run it in a simulator to see the Basic UI in action

**If you've come across any issues and are unable to get your code up and running then here is the [link to the XCode project](resources/FoodTracker) for this Tutorial.**
