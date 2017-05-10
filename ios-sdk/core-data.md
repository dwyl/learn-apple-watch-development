## **Creating a simple one table database with Core Data in iOS 10 using Swift 3.1**

Today we'll be talking a look at **Core Data** and how to make use of it in the simplest of examples for iOS 10 using Swift 3.1

### What is Core Data?

It's a framework that helps you build and manage the model layer object in your application.

### Why do you need Core Data?

If your app needs to store data and be quick at doing so, you'll probably want to look at saving information in a database and querying the information using Core Data.

_There is another way to store data in iOS using `NSKeyedArchiver` but it doesn't give you the benefits that you'd get from using `Core Data` such as an Entity Model and Querying the data at blazing fast speeds._

Core Data basically give you the ability to create a relational database and query it with ease.

### How do you use Core Data?

Lets say we have an iOS app that lets a user add a dwyl repo and the number of stars it has in a table.

| Repo Name | Repo Stars |
|:---------:|:---------:|
| learn-apple-watch-development | 11 |
| learn-travis | 270 |
| learn-hapi | 508 |


We will want to store this information so that the it isn't lost when the app is closed or cleared from the phone's memory. We can do this by storing the information using core data.

### Initialise Core Data

 The first step we need to take when we want to use Core Data is to make sure that we've checked the core data checkbox when creating a project

 <img width="733" alt="screen shot 2017-03-10 at 15 31 13" src="https://cloud.githubusercontent.com/assets/2305591/23801132/e9d7f46e-05a6-11e7-9e9f-10b31524481e.png">


**This will automatically add a file with the extension of `.xcdatamodeld`**


Don't worry if you haven't created the project with the core data, you can always add it at a later stage by adding a new file with the type of data model

<img width="732" alt="screen shot 2017-03-10 at 15 37 21" src="https://cloud.githubusercontent.com/assets/2305591/23801296/923f174a-05a7-11e7-8d30-fbfc8425fae7.png">


### Set up Database Entity

Navigate to the file with the extension `.xcdatamodeld` and add a new entity using the **Add Entity** icon present in the botton left corner
<img width="72" alt="screen shot 2017-03-10 at 15 42 05" src="https://cloud.githubusercontent.com/assets/2305591/23801491/3c7eacf2-05a8-11e7-9c22-8b6765dccb64.png">
Rename the entity to `Repo` and add two attributes:
<img width="92" alt="screen shot 2017-03-10 at 15 49 54" src="https://cloud.githubusercontent.com/assets/2305591/23801782/443c94f8-05a9-11e7-8208-b744562b7b11.png">
**name: String**
**star: Integer 16**
<img width="262" alt="screen shot 2017-03-10 at 15 51 30" src="https://cloud.githubusercontent.com/assets/2305591/23801888/987758be-05a9-11e7-8fd2-d22e90f6d17c.png">

You'll notice that alongside setting the name and the type for the given attribute you can also set validation for each of them. We recommend that you set some form of validation for each of your attributes.


That's it, You've now created your first Data Model!

### View data using Core Data Framework

We want to wire up our existing view so that we can see the actual list of data that is being stored in the database.

We can do this by adding a the following lines to our existing viewController

```js
import CoreData

//then inside your viewController
var repos: [NSManagedObject] = []

//then inside your viewDidLoad()

// Step 1 create app delegate
guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
else {
  return
}

// Step 2 create an instance of NSManagedObjectContext
let managedContext = appDelegate.persistentContainer.viewContext

// Step 3 create a fetch request which when fired will return all the
// repos inside of the Repo Entity
let fetchRequest =
    NSFetchRequest<NSManagedObject>(entityName: "Repo")

// Step 4 we fetch the data and assing the newly fetched repos to
// the repos object that was created earlier
do {
    tasks = try managedContext.fetch(fetchRequest)
} catch let error as NSError {
    print("Could not fetch. \(error), \(error.userInfo)")
}

```

With these 4 steps we've managed to fetch all the data that is currently in our database. If you are showing these on your tableView then you'll notice that it is empty :cry: Don't worry we'll learn how to add & remove items from the database next! :blush:

### Add data using Core Data Framework

In your view where you are saving the data to the table. lets import the core data framework so that we can use all the related methods in the given viewController file.

```js
import CoreData
```

Now lets create a function that will save the data to the database.

```js
func save(name: String, star: Int16) {

  // Step 1 create app delegate
  guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
  else {
    return
  }

  // Step 2 create an instance of NSManagedObjectContext
  let managedContext = appDelegate.persistentContainer.viewContext

  // Step 3 create an instance of NSManagedObjectContext which
  // just fetches all the attribute information for the given entity
  // using NSEntityDescription and then creates a variable called
  // repo which contains all the data required.

  let entity = NSEntityDescription.entity(forEntityName: "Repo",
                                          in: managedContext)!

  let repo = NSManagedObject(entity: entity,
                             insertInto: managedContext)
  print("\(repo), REPO")

  // Step 2 will return a Repo with name and star set to the default,
  // (for me it will set it to nil for the name and 0 for the star,
  // it could be different if you've set your default value to something different)
  // We change this to the new ones that are being passed into this
  // function in Step 3
  task.setValue(name, forKeyPath: "name")
  task.setValue(star, forKeyPath: "star")

  // Step 4 we save the data using the .save() method. Please note
  // that is recommended that you put this in a try catch block so that you
  // don't crash the app if you run into an error when saving the data.
  do {
      try managedContext.save()
  } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
  }

}
```
There you have it, if you run this function in the place where you are saving the data, it will now store this data in our database!

### Remove data using Core Data Framework

Now that we have the ability to save data, we can add another function that will allow us to delete the data.

```js

guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
else {
    return
}

let managedContext = appDelegate.persistentContainer.viewContext

repo.remove(at: indexPath.row)

```

You'll notice that our first couple of steps are very similar to when we are saving the data.

Once we create an appDelegate and create a variable that stores the context all we need to do is call `remove(at:Int)` where you enter the row number that you'd like to delete. For me as I am using a Table view I would write the above function as `remove(at:indexPath.row)`

You've made it through to the end! you've successfully managed to use Core Data to add/remove & view data that is stored in your newly built database.

Please remember that this was written during my transition from being a JavaScript developer to a Swift developer, in other words I'm a complete beginner to Swift and the iOS SDK, so if you find that I've missed something or that there is an alternative way achieve the above, I'd love to hear back from you and improve upon what already exists.

#### [**Sohil Pandya**](https://github.com/sohilpandya)  
[**dwyl**](https://github.com/dwyl)
