# Interactivity between an iPhone & Apple Watch

Now that we've build a few stand alone apps for both the iPhone and Apple Watch, <br>
It's time to build 👷‍ something that will work on both devices!

Our first step would be to go about understanding how to connect iPhone to an Apple <br>
Watch, enter:
### [WatchConnectivity Framework](https://developer.apple.com/reference/watchconnectivity)
**Used to connect and relay messages in both directions between the two devices**

We'll be using the [classes](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html) and [protocol](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html) provided by this framework to create a connection in our app.

#### Setup

##### Project
Create a Project (iOS App with WatchKit App)
<img width="758" alt="screen shot 2016-12-05 at 17 27 45" src="https://cloud.githubusercontent.com/assets/2305591/20895155/2a98e8fa-bb10-11e6-8b6d-3e87251dd93f.png">

##### Watch
Create a Button (style it as you wish) and connect it to the controller as an action

<img width="216" alt="screen shot 2016-12-05 at 17 31 54" src="https://cloud.githubusercontent.com/assets/2305591/20895335/ee359e2a-bb10-11e6-9d5d-19b254978982.png">

```js
@IBAction func buttonClicked() {
    print("Button Clicked!")
}
```

Next we need to use the WatchConnectivity framework to setup the Watch to be able to send and receive requests from the phone.

Firstly lets import `WatchConnectivity` and require it in the controller class

```js
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

public func session(_ session: WCSession, activationDidCompleteWith
  activationState: WCSessionActivationState, error: Error?) {
  // leave empty
 }

 //rest of code
}

```

As you can see above, we have a required method called `activationDidCompleteWith:error`, This is called when the activation of a method finishes


Next lets **activate** and **initialise** the `WCSession` that will establish a connection between the two devices

```js
// if WCSession is supported then create a default session
fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil

// activate the optional session?
override init() {
    super.init()

    session?.delegate = self
    session?.activate()
}
```

Lets send the message off to the phone, to do so, we need to go back to the buttonClick action and send the message. **sendMessage is one of the ways to transfer information from the watch to the phone**


```js
// INSIDE buttonClick Action
let applicationData = ["counterValue" : 1]

// The paired iPhone has to be connected via Bluetooth.
if let session = session, session.isReachable {
    session.sendMessage(applicationData,
                        replyHandler: { replyData in
                            // handle reply from iPhone app here
                            print(replyData)
    }, errorHandler: { error in
        // catch any errors here
        print(error)
    })
} else {
    // when the iPhone is not connected via Bluetooth
}
```

##### Phone

The setup on the watch is pretty much complete, so lets move onto the phone.

Create some Labels and a button, also connect the button and one of the labels up to the controller so that if a user touches the button, then the text on the label will change to `phone click`

![screen shot 2016-12-06 at 11 56 15](https://cloud.githubusercontent.com/assets/2305591/20924731/088e19d8-bbab-11e6-9514-d769c33e9492.png)

I've connected up my button and the label that says "No"
```js
@IBOutlet weak var clickedLabel: UILabel!

@IBAction func phoneButtonClicked(_ sender: UIButton) {
     self.clickedLabel.text = "Phone Click"
     print("clicked on Phone")

 }
```

Now lets create the `WCSession` on the watch so that the two devices can interact with each other
```js
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

  public func sessionDidDeactivate(_ session: WCSession) {
      // Code
  }
  public func sessionDidBecomeInactive(_ session: WCSession) {
      // Code
  }
  public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
      // Dummy Implementation
  }

  // if WCSession is supported then create a default session
  fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil

  // activate the optional session?
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)

      session?.delegate = self
      session?.activate()
  }

//Rest of the code
}
```
You'll notice a couple more required methods in the phones controller.

Now lets write the method that will receive the message that has been sent by the Watch
```js
func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {

    DispatchQueue.main.async {
        print("Yes")
        self.clickedLabel.text = "Watch Click"
    }
}
```

And that should be it! If we run the simulator for both the iPhone and Apple Watch, you should be able to see it all working as expected.
![ezgif com-video-to-gif](https://cloud.githubusercontent.com/assets/2305591/20884261/048bc14c-bae2-11e6-8ae5-11afe232ed25.gif)

***

**Hint**  
If you are unable to get both the simulators working then Change the active scheme from just app to apple watch app + phone app as seen below
<img width="643" alt="screen shot 2016-12-02 at 17 58 19" src="https://cloud.githubusercontent.com/assets/2305591/20844701/04126ac0-b8b9-11e6-9762-c2ba92381528.png">  
**Hint**
