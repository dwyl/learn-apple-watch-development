### In this tutorial we'll be building a simple app that will let us access users HealthKit data. We'll be starting out with trying to find out the total number of steps taken over a given period of time by the user.

### Setup

Let's start out by creating a new project. I've called it `healthkit-steps`
![screen shot 2017-07-12 at 12 00 04](https://user-images.githubusercontent.com/2305591/28114669-af98569a-66f9-11e7-9299-0c7a8a4274ae.png)

Next in order for us to be able to access healthkit data we need to take the following two steps:
1. turn on the capability to access healthkit framework
![screen shot 2017-07-12 at 12 01 37](https://user-images.githubusercontent.com/2305591/28114832-6dcf9cb8-66fa-11e7-88b2-f39d710991db.png)

2. **Very Important** After iOS10 we will have to add description keys to our info.plist file to access or update HealthKit Data. The app will crash if we do not have these descriptions keys in place.
![screen shot 2017-07-12 at 12 12 10](https://user-images.githubusercontent.com/2305591/28115228-f7313862-66fb-11e7-98e2-c95103a3df44.png)
  - Add **Privacy - Health Update Usage Description** if you would like to update Healthkit data
  - Add **Privacy - Health Share Usage Description** if you would like to obtain HealthKit data
  - The description you provide will be shown to the user when they are asked for permission to authorise the app.


### Asking for permission to use HealthKit

In order to access a user's HealthKit data we need to ask for permission from the user, we can do this by adding a button on the storyboard and linking it to a function that will ask for user permissions.
![screen shot 2017-07-12 at 12 38 46](https://user-images.githubusercontent.com/2305591/28116082-64cbdf0a-66ff-11e7-9d4d-c26e86528a18.png)

```swift

import HealthKit // import this at the top of the file

class ViewController: UIViewController {
    let healthStore = HKHealthStore()

// Rest of your code

    @IBAction func authoriseHealthKitAccess(_ sender: Any) {
        let healthKitTypes: Set = [
            // access step count
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        ]
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (_, _) in
            print("authrised???")
        }
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (bool, error) in
            if let e = error {
                print("oops something went wrong during authorisation \(e.localizedDescription)")
            } else {
                print("User has completed the authorization flow")
            }
        }
    }

// Rest of your code

}
```
Here is what is happening in the above block of code:

- We are defining the type of data we want to access from HealthKit, for the user we've specified step count as the type of identifier from which we will access samples from. There are a whole list more identifiers which we can ask for, you can view the list [here](https://developer.apple.com/documentation/healthkit/hkquantitytypeidentifier)
- We are then calling the `requestAuthorization` method from the healthStore which will ask the user for read/write access to the given identifiers. A `set` has to be provided as the argument even if we are just requesting access to one type of data.

If we run the app in the simulator and select the button, we'll be taken to the authorization screen.
![screen shot 2017-07-12 at 12 55 52](https://user-images.githubusercontent.com/2305591/28116584-94bda408-6701-11e7-8d10-615a7d4c3955.png)

_You can also see that the description we provided in the `info.plist` is used as the description when asking for permission._

Turn on the access for our app and select Allow, we now have access to read and write to the step count data provided by HealthKit! 🎉

### Fetching steps count from HealthKit store

Now that we can access the user's data, let's try to get the number of steps the user may have taken over a given period of time. For this, we need to add a button and a label so that we can ask and then display the data in the app.
![screen shot 2017-07-12 at 13 18 09](https://user-images.githubusercontent.com/2305591/28121246-617a7ede-6712-11e7-87ab-719c4fe2e5e8.png)

```swift
    func getTodaysSteps(completion: @escaping (Double) -> Void) {

        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!

        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            var resultCount = 0.0
            guard let result = result else {
                print("Failed to fetch steps rate")
                completion(resultCount)
                return
            }
            if let sum = result.sumQuantity() {
                resultCount = sum.doubleValue(for: HKUnit.count())
            }

            DispatchQueue.main.async {
                completion(resultCount)
            }
        }
        healthStore.execute(query)
    }

    @IBOutlet weak var totalSteps: UILabel!
    @IBAction func getTotalSteps(_ sender: Any) {
        getTodaysSteps { (result) in
            print("\(result)")
            DispatchQueue.main.async {
                self.totalSteps.text = "\(result)"
            }
        }
    }
```

Here is what is happening in the above block of code:
- We are running a function on click on the `getTotalSteps` button, which in turn runs the function that will return the total number of steps.
- In the `getTodaysSteps` we are creating a [HKquery](https://developer.apple.com/documentation/healthkit/hkquery) by which we will be able to access the HealthKit Data.
- `HKStatisticsQuery` will perform statistical calculations for the given data and return matching samples, it can calculate minimum, maximum and average values for the quantities. This is perfect for our need as it will return the sumQuantity for the total number of steps.
    - It also requires a time between which it should run its calculations, we've set it so that we get stats for the number of steps from the start of the day.
- This is done on a background thread so in order for us to view the total number of steps we will have to push it onto the main thread.

If we build and run this code on the simulator we'll notice that the total number of steps is unfortunately equal to 0.0, this is because the simulator does not have any data. If we try to run the app on our iPhone and see the total number of steps, it should show a real number. 🎉 (don't forget to authorise the app before pressing the get count button)
